#!/usr/bin/env python3

import os
import os.path
import re
import stat
import json
import urllib.request
from ansible.module_utils.basic import AnsibleModule

def main():
    module = AnsibleModule(
        argument_spec={
            "name": {"required": True},
        }
    )
    name = module.params["name"]
    resource_dir = "/opt/bin/command_resources"
    bin_dir = "/opt/bin"
    arch = re.compile(r'.*linux[-_](x86_|amd)64.*', re.IGNORECASE)

    changed, msg = run(name,resource_dir,bin_dir,arch)
    module.exit_json(changed=changed, msg=msg)


def run(name, resource_dir, bin_dir, arch):
    os.makedirs(resource_dir, exist_ok=True)
    os.makedirs(bin_dir, exist_ok=True)

    resp = json.loads(
        urllib.request.urlopen(
            f"https://api.github.com/repos/{name}/releases/latest"
        ).read()
    )

    tag = resp["tag_name"]
    workdir = f"{resource_dir}/{name}/{tag}"
    if os.path.exists(workdir):
        return False, None
    os.makedirs(workdir)
    os.chdir(workdir)

    command_name, arch, ex_command = info(name)

    # download asset
    asset_url = None
    for a in resp["assets"]:
        if arch in a["name"]:
            asset_url = a["browser_download_url"]
            break
    if asset_url is None:
        return True, f"asset not found for the arch"
    asset_filename = asset_url.split("/")[-1]
    urllib.request.urlretrieve(asset_url, asset_filename)

    # extract and get original binary path
    bin, err = extract(asset_filename, command_name, ex_command)
    if err is not None:
        return True, err
    original_path = f"{bin_dir}/{bin}"

    # make link and add exec permission
    if os.path.exists(original_path):
        os.remove(original_path)
    os.symlink(f"{workdir}/{bin}", original_path)
    mode = os.stat(original_path).st_mode | stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH
    os.chmod(original_path, mode)

    return True, None


def extract(asset, command, ex_command):
    import subprocess
    subprocess.run(ex_command.replace("FILE", asset) + f" > {command}", shell=True)
    return command, None

def info(name):
    if name == "cumet04/atcoder-gli":
        return "acg", "linux_amd64", "tar xf FILE -O atcoder-gli_linux_amd64/acg"
    if name == "mattn/cho":
        return "cho", "linux_amd64", " | ".join(["tar tf FILE",
                                          "grep 'cho$'",
                                          "xargs tar xf FILE -O"])
    if name == "docker/compose":
        return "docker-compose", "Linux-x86_64", "cat FILE"
    if name == "denoland/deno":
        return "deno", "x86_64-unknown-linux", "unzip -p FILE deno"


if __name__ == "__main__":
    if "TEST_ARG_NAME" in os.environ:
        from ansible.module_utils import basic
        from ansible.module_utils._text import to_bytes

        args = {"name": os.environ["TEST_ARG_NAME"]}
        basic._ANSIBLE_ARGS = to_bytes(json.dumps({"ANSIBLE_MODULE_ARGS": args}))

    main()

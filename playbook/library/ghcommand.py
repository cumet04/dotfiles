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
    arch = re.compile(r'.*linux[-_]x86_64.*', re.IGNORECASE)

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
        module.exit_json(changed=False)
        return
    os.makedirs(workdir)
    os.chdir(workdir)

    # download asset
    asset_url = None
    for a in resp["assets"]:
        if re.match(arch, a["name"]):
            asset_url = a["browser_download_url"]
            break
    if asset_url is None:
        module.exit_json(failed=True, msg=f"asset not found for the arch")
        return
    asset_filename = asset_url.split("/")[-1]
    urllib.request.urlretrieve(asset_url, asset_filename)

    # extract and get original binary path
    bin, err = extract(name, asset_filename)
    if err is not None:
        module.exit_json(failed=True, msg=err)
    original_path = f"{bin_dir}/{bin.split('/')[-1]}"

    # make link and add exec permission
    if os.path.exists(original_path):
        os.remove(original_path)
    os.symlink(f"{workdir}/{bin}", original_path)
    mode = os.stat(original_path).st_mode | stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH
    os.chmod(original_path, mode)

    module.exit_json(changed=True)


def extract(name, filename):
    if name == "lemonade-command/lemonade":
        return extract_lemonade(filename)
    if name == "cumet04/atcoder-gli":
        return extract_acg(filename)
    if name == "mattn/cho":
        return extract_cho(filename)
    if name == "docker/compose":
        return extract_compose(filename)
    else:
        return None, "extract way is not defined"


def extract_lemonade(filename):
    import tarfile

    tarfile.open(filename).extractall()
    return "lemonade", None


def extract_cho(filename):
    import tarfile

    with tarfile.open(filename) as tar:
        tar.extractall()
        for file in tar.getmembers():
            if file.name.endswith("/cho"):
                return file.name, None
    return None, "target binary is not found"


def extract_compose(filename):
    os.rename(filename, "docker-compose")
    return "docker-compose", None

def extract_acg(filename):
    import tarfile

    with tarfile.open(filename) as tar:
        tar.extractall()
        for file in tar.getmembers():
            if file.name.endswith("/acg"):
                return file.name, None
    return None, "target binary is not found"


if __name__ == "__main__":
    if "TEST_ARG_NAME" in os.environ:
        from ansible.module_utils import basic
        from ansible.module_utils._text import to_bytes

        args = {"name": os.environ["TEST_ARG_NAME"]}
        basic._ANSIBLE_ARGS = to_bytes(json.dumps({"ANSIBLE_MODULE_ARGS": args}))

    main()

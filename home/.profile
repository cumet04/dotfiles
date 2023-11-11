# 環境変数はbash（wslでのデフォルトシェル）で読むようにすることでvscodeなどにも反映させる

export PATH=/opt/go/current/bin:$PATH
export PATH=/opt/anyenv/envs/rbenv/shims:$PATH
export PATH=/opt/anyenv/envs/nodenv/shims:$PATH
export PATH=$HOME/dotfiles/shell_commands:$PATH

# anyenv variables
export ANYENV_ROOT=/opt/anyenv
export RBENV_ROOT=/opt/anyenv/envs/rbenv
export NODENV_ROOT=/opt/anyenv/envs/nodenv
export RBENV_SHELL=fish
export NODENV_SHELL=fish

export EDITOR=nano
export NPM_CONFIG_UPDATE_NOTIFIER=false # npm実行時のnpm新バージョンアップデートnoticeを消す

# clean $HOME
export npm_config_cache=~/.cache/npm
export CDK_HOME=~/.cache/cdk
export BUNDLE_USER_HOME=~/.cache/bundle
export HISTFILE=~/.cache/history
export NODE_REPL_HISTORY=~/.cache/node_repl_history
export SQLITE_HISTORY=~/.cache/sqlite_history
export MYSQL_HISTFILE=~/.cache/mysql_history
export LESSHISTFILE=- # disable .lesshst
export ANSIBLE_RETRY_FILES_ENABLED=false
export GOMODCACHE=~/.cache/go/pkg/mod
export DOCKER_CONFIG=~/.config/docker
export SOLARGRAPH_CACHE=~/.cache/solargraph
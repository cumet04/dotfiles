export EDITOR=nano
export WSL_SELF_HOST=$(hostname -I | cut -d' ' -f1)
export PATH=$HOME/dotfiles/shell_commands:$PATH

# xdg
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export GNUPGHOME=$XDG_DATA_HOME/gnupg
export PASSWORD_STORE_DIR=$XDG_DATA_HOME/password-store
export AWS_CONFIG_FILE=$XDG_CONFIG_HOME/aws/config

# asdf
export ASDF_DIR=/opt/asdf-vm
export ASDF_DATA_DIR=$ASDF_DIR
export ASDF_CONFIG_FILE=~/.config/asdfrc
export PATH=$ASDF_DIR/bin:$ASDF_DIR/shims:$PATH
export ASDF_GOLANG_MOD_VERSION_ENABLED=true # Noticeメッセージ抑制

# clean $HOME
export npm_config_cache=~/.cache/npm
export CDK_HOME=~/.cache/cdk
export BUNDLE_USER_HOME=~/.cache/bundle
export NODE_REPL_HISTORY=~/.cache/node_repl_history
export SQLITE_HISTORY=~/.cache/sqlite_history
export MYSQL_HISTFILE=~/.cache/mysql_history
export LESSHISTFILE=- # disable .lesshst
export ANSIBLE_RETRY_FILES_ENABLED=false
export GOMODCACHE=~/.cache/go/pkg/mod
export DOCKER_CONFIG=~/.config/docker
export SOLARGRAPH_CACHE=~/.cache/solargraph

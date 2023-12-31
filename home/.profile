# 環境変数はbash（wslでのデフォルトシェル）で読むようにすることでvscodeなどにも反映させる

export PATH=$HOME/dotfiles/shell_commands:$PATH

export ASDF_DIR=/opt/asdf
export ASDF_DATA_DIR=$ASDF_DIR
export ASDF_CONFIG_FILE=~/.config/asdfrc
export PATH=$ASDF_DIR/bin:$ASDF_DIR/shims:$PATH
export ASDF_GOLANG_MOD_VERSION_ENABLED=true # Noticeメッセージ抑制

export EDITOR=nano
export NPM_CONFIG_UPDATE_NOTIFIER=false # npm実行時のnpm新バージョンアップデートnoticeを消す

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

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

export GNUPGHOME=$XDG_DATA_HOME/gnupg
export PASSWORD_STORE_DIR=$XDG_DATA_HOME/password-store
export AWS_CONFIG_FILE=$XDG_CONFIG_HOME/aws/config

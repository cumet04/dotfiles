export EDITOR=nano

# xdg
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export AWS_CONFIG_FILE=$XDG_CONFIG_HOME/aws/config

# gcloud向け: Netskope共存のためSSL検証を無効化(auth/disable_ssl_validation)しており、その際に毎回出る
# urllib3のInsecureRequestWarningをメッセージ前方一致で抑止する
export PYTHONWARNINGS='ignore:Unverified HTTPS request'

# clean $HOME
export npm_config_cache=~/.cache/npm
export CDK_HOME=~/.cache/cdk
export BUNDLE_USER_HOME=~/.cache/bundle
export NODE_REPL_HISTORY=~/.cache/node_repl_history
export SQLITE_HISTORY=~/.cache/sqlite_history
export MYSQL_HISTFILE=~/.cache/mysql_history
export LESSHISTFILE=- # disable .lesshst
export GOMODCACHE=~/.cache/go/pkg/mod
export DOCKER_CONFIG=~/.config/docker

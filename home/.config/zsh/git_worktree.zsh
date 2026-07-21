# git branch と git worktree を統合して switch / 削除するヘルパー
#   gwt [branch]    : ブランチへswitch。worktreeで使用中のブランチならそのディレクトリへcd
#   gwt -d [branch] : ブランチを削除。worktreeがあれば worktree remove してから branch -d
#   gwt -D [branch] : 同上の強制版 (remove --force + branch -D)
# branch省略時は cho で選択する。一覧にはworktreeのパスを併記する
function gwt() {
  local mode=switch
  case $1 in
    -d) mode=delete; shift ;;
    -D) mode=force-delete; shift ;;
  esac

  local branch=$1
  if [[ -z $branch ]]; then
    local selected=$(
      git branch --format='%(HEAD) %(refname:short)%09%(worktreepath)' |
      column -ts$'\t' |
      cho
    )
    [[ -z $selected ]] && return
    branch=$(echo "$selected" | sed 's/^..//' | cut -d' ' -f1)
  fi

  # branchがworktreeで使用中ならそのパスを得る (main worktree含む)
  local wtpath=$(
    git worktree list --porcelain |
    awk -v ref="refs/heads/$branch" \
      '/^worktree /{p=substr($0,10)} $0=="branch "ref{print p}'
  )
  local here=$(git rev-parse --show-toplevel)

  case $mode in
    switch)
      if [[ -z $wtpath ]]; then
        git switch -q $branch
      elif [[ $wtpath != $here ]]; then
        cd $wtpath
      fi
      git s
      ;;
    delete|force-delete)
      if [[ $wtpath == $here ]]; then
        echo "gwt: 現在チェックアウト中のブランチは削除できません: $branch" >&2
        return 1
      fi
      if [[ $mode == delete ]]; then
        [[ -n $wtpath ]] && { git worktree remove $wtpath || return }
        git branch -d $branch
      else
        [[ -n $wtpath ]] && { git worktree remove --force $wtpath || return }
        git branch -D $branch
      fi
      ;;
  esac
}

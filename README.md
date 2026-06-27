Mac
-----

#### 初回セットアップ
* 事前に https://brew.sh/ よりbrewセットアップを行う
  - ここにxcode-select installが含まれる

```bash
git clone -b mac2026 https://github.com/cumet04/dotfiles $HOME/dotfiles
cd $HOME/dotfiles
./setup-mac.sh
```

その後:
* `cp home/.gitconfig ~/` してemailを書き換える
* `gh auth login`
* `colima start` の初回手動実行 (VMイメージダウンロード)
* Claude Code入れる https://code.claude.com/docs/ja/quickstart

Mac
-----

#### 初回セットアップ

```bash
git clone -b mac2026 https://github.com/cumet04/dotfiles $HOME/dotfiles
cd $HOME/dotfiles
./setup-mac.sh
```

その後:
* `cp home/.gitconfig ~/` してemailを書き換える
* `gh auth login`
* `colima start` を一度手動実行（初回は VM イメージのダウンロードが発生するため brew services での自動起動が失敗する）

Claude
-----

#### claude codeのセットアップ
公式手順で入れる

https://code.claude.com/docs/ja/quickstart

# dotfiles — LLM向けコンテキスト

## 概要

macOS (Apple Silicon) 向け dotfiles。設定管理は shell script + Brewfile + mise。

- ブートストラップ: `setup-mac.sh`
- ツール管理: `Brewfile` + `home/.config/mise/config.toml`
- 設定配置: `stow` で `home/.config/*` を `~/.config/*` へ symlink

## ツールインストールの方針

### 優先順位

1. **mas** — Mac App Store で入手できるなら最優先。該当することは少ないが優先度は最高。
2. **mise** — CLI ツールの第一選択。`home/.config/mise/config.toml` に追加する。
3. **Brewfile** — mise で入らないものだけ。理由をコメントに明記する。
4. **brew cask** — GUI アプリ、または独自コンポーネント管理を持つツール（例: gcloud）。

### mise のバックエンド選択

- `core` > `aqua` > `vfox` / `asdf` の順で優先する。
- デフォルトで `aqua` 以外（`vfox` 等）が選ばれるツールは、`config.toml` で backend を明示する。
  ```toml
  "aqua:neovim/neovim" = "latest"  # デフォルトだと vfox が選ばれるため aqua を明示
  ```
- `github:owner/repo` 形式は GitHub Releases から直接取得する mise の backend。mise registry に未収載のツールに使う。

### Brewfile に置くもの

- mise 本体・stow（ブートストラップに必要なもの）
- GNU coreutils（PATH は `.zshenv` で `/opt/homebrew/opt/coreutils/libexec/gnubin` を追加）
- mise registry に未収載の CLI（`tig`, `tree` など、プリビルドバイナリ配布がないもの）
- GUI アプリや独自管理ツール（`cask "google-cloud-sdk"` 等）

### 追加しない・後回しにするもの

- 欲しくなったら入れる方針。パッケージリストを増やすことより、必要なときに追加する。
- `mas`（Mac App Store）: 現在該当なし。GUI アプリが増えたら検討。

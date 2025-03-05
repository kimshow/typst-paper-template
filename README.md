# Typst 修士論文テンプレート

このリポジトリは、Typstを使用して修士論文を作成するためのテンプレートです。
(this file was made by claude 3.7)

## 1. Typstのインストール

### Windows
1. [Typst公式サイト](https://typst.app/)からTypstをダウンロード
2. インストーラーを実行

### Mac
```bash
brew install typst
```

### Linux (Ubuntu)
```bash
# 依存パッケージのインストール
sudo apt update
sudo apt install curl

# Typstのインストール
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install typst-cli
```

## 2. 開発環境の構築

### VSCode (推奨)
1. VSCodeをインストール
2. 拡張機能「Typst LSP」をインストール
   - コード補完
   - シンタックスハイライト
   - プレビュー機能
   が利用可能になります

### その他のエディタ
- Vim/Neovim: [typst.vim](https://github.com/kaarmu/typst.vim)
- Emacs: [typst-mode](https://github.com/Ziqi-Yang/typst-mode)

## 3. このテンプレートの使い方

### ファイル構成
```
.
├── main.typ          # メインファイル
├── template.typ      # テンプレート定義
├── master_thesis.bib # 参考文献
└── Figures/         # 図表用ディレクトリ
```

### 基本的な使い方

1. `main.typ`の以下の部分を編集して、基本情報を設定します：

```typ
#show: master_thesis.with(
  title: "あなたのタイトル",
  author: "あなたの名前",
  university: "あなたの所属",
  school: "あなたの研究科",
  department: "あなたの専攻",
  department2: "あなたの専攻2",
  id: "あなたの学籍番号",
  mentor: "あなたの指導教官",
  mentor-post: "あなたの指導教官の肩書き",
  class: "修士",
  abstract_ja: [
    あなたの概要
  ],
  keywords_ja: ("キーワード1", "キーワード2", "キーワード3"),
  bibliography-file: "master_thesis.bib",
)
```

2. 本文を記述します。主な記法：

```typ
= 第1章 <chapter1>  // 章の作成
== 1.1 節           // 節の作成
=== 1.1.1 項        // 項の作成

// 図の挿入
#img(image("Figures/example.jpg", width: 70%), 
    caption: [図のキャプション])<fig_label>

// 表の挿入
#tbl(table(
  columns: 2,
  [項目1], [項目2]
), caption: [表のキャプション])<tbl_label>

// 参照
@fig_label  // 図の参照
@tbl_label  // 表の参照
@chapter1   // 章の参照

// 文献引用
@author2024  // 文献の引用
```

3. コンパイル方法：

```bash
# PDFの生成
typst compile main.typ

# 変更を監視して自動コンパイル
typst watch main.typ
```

### 参考文献の追加

`master_thesis.bib`にBibTeX形式で文献情報を追加します：

```bibtex
@article{author2024,
  title  = {論文タイトル},
  author = {著者名},
  journal = {ジャーナル名},
  year   = {2024},
  volume = {1},
  pages  = {1--10}
}
```

## ライセンス

MITライセンスの下で公開されています。詳細は[LICENSE](LICENSE)ファイルをご覧ください。

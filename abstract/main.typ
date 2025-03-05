#import "template.typ": *
#import "@preview/metro:0.1.0": * // 単位系のパッケージ
#import "@preview/subpar:0.2.0" //subfigureのパッケージ


#let title="あなたのタイトル"
#let affiliation="あなたの所属"
#let author="あなたの名前"
#let bibliography-file = "master_thesis.bib" //あなたのbibファイル
#let abst="あなたのアブストラクト"

#show: thesis_abstract.with(
  title: title,
  affiliation: affiliation,
  author: author,
  abstract: abst,
  bibliography_file: bibliography-file,
)

= 緒言
こんな風に

引用もできる@tadokoro2025 。

#colbreak() //改カラム
強制的改カラム
= 実験方法
text関数でいろいろ遊べる

#text(size:40pt,"実験とか")

= 結果と考察
結果とか

= 結言
まとめとか


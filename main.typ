#import "template.typ": * // テンプレート
#import "@preview/metro:0.1.0": * // 単位系のパッケージ
#import "@preview/subpar:0.2.0" //subfigureのパッケージ
#import "@preview/codelst:2.0.1": sourcecode //コードブロックのパッケージ

#let bibliography-file = "master_thesis.bib"
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
  class: "あなたの学位",
  abstract_ja: [
    あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要あなたの概要
  ],
  keywords_ja: ("あなたのキーワード1", "あなたのキーワード2", "あなたのキーワード3","あなたのキーワード4", "あなたのキーワード5"),
  bibliography-file: "master_thesis.bib",
)

= 緒言<Chap_1>
== 我是京都大学的学生
=== これはTypstのテンプレートです
==== もう書くことないねん
こんな感じで章段落を作ることができる。

#sourcecode[```
= 緒言<Chap_1>
こんな感じでHeadingにレファレンスを設けられる。
```]
#sourcecode[```
文中で@レファレンス名で
@Chap_1 みたいに参照可能
```]
とすることで,
@Chap_1 みたいに参照可能

#sourcecode[```
改ページは
#pagebreak()
でできる。
```]

#pagebreak()

#sourcecode[```
改ページは
#pagebreak(to:"odd")
#pagebreak(to:"even")
でできる。
```]
oddで奇数ページ, つまり表紙から数えたら右側のページに, evenで偶数ページ, つまり表紙から数えたら左側のページに改ページする。

= 図表の挿入
新しい章になると右ページになるようになっている。
== 画像の挿入
もちろん画像の挿入も可能。
#img(image("Figures\katsura.jpg", width: 100pt), caption:[京都大学(width: 100pt)])<katsura_100pt>
#img(image("Figures\katsura.jpg", width: 70%), caption:[京都大学(width: 70%)])<katsura_70percent>

@katsura_100pt みたいにlabelをつけると, そのlabelを参照できる。
image関数内の手続きはTypstのドキュメントを参照。

#link("https://typst.app/docs/reference/visualize/image/")


== 画像を横並びにしたいときは
subpar環境でgridを使い, それをimgで囲むと画像を並べることができる。
#img(
  subpar.grid(
    columns: 2,
    figure(image("Figures/katsura.jpg", width: 100%),
    caption:[京都大学(width: 100pt)]),<katsura_left>,
    figure(image("Figures/katsura.jpg", width: 48.5%),
    caption:[京都大学(width: 48.5%)]),<katsura_right>,
    numbering: image_num,
    supplement: "図",
    numbering-sub: "(a)",
  ),
  caption: [桂キャンパスの写真]
)<katura_grid>
@katura_grid みたいにlabelをつけると, そのlabelを参照できる。
@katsura_left みたいにlabelをつけると, #text(size:30pt, weight:"bold", "そのlabelを参照できるようにしたかったんですけど, 使う機会なくてやりませんでした。任せます。")

@katsura_right じゃなくて図1.3(b)みたいにしたかってん。

表もtbl関数で作ることができる。
#tbl(table(
  columns: 2,
  [a],[a]
), caption: [表のキャプション])

でもこれでは枠線があるので、stroke:noneで消すと
#tbl(table(
  columns: 2,
  stroke:none,
  [a],[a]
), caption: [表のキャプション2])
必要に応じてtable.hline(stroke:1pt)で線を引くとよい
#tbl(table(
  columns: 2,
  stroke:none,
  table.hline(stroke:1pt),
  [a],[a],
  table.hline(stroke:1pt),
), caption: [表のキャプション3])<表>

@表 もちろん表も参照できる。

#link("https://typst.app/docs/reference/model/table/")


= 文献の引用の仕方

こうだよ@tadokoro2025。
#sourcecode[```
こうだよ@tadokoro2025。
```]
こうでもいいよ#cite(<tadokoro2025>)
#sourcecode[```
こうでもいいよ#cite(<tadokoro2025>)
```]

参考文献には文中で引用した文献だけが引用した順に並ぶ。



#bibliography(bibliography-file, title: "参考文献", style: "csl/chemical-engineering-journal.csl") // ここに参考文献を記載


#set heading(numbering: none) // 謝辞のHeading番号を消す
= 謝辞
Heading 番号を消せば謝辞も書ける。

#appendices[
  = Appendix
  Appendix環境は
  ```
  #appendices[
    = Appendix
  ]
  ```
  のように書く。

  == Appendixの1
  == Appendixの2
  #pagebreak()
  == Appendixの3
  == Appendixの4
  == Appendixの5
  == Appendixの6
  == Appendixの7
  == Appendixの8

  こんな感じでAppendixを作ることができる。

  ]
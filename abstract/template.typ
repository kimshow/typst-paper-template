// 表番号のフォーマット設定
// 章番号.表番号 の形式で表示
#let table_num(_) = {
  context {
    let chapt = counter(heading).get().at(0)
    let c = counter("table-chapter" + str(chapt))
    let n = c.get().at(0)
    c.step()
    str(chapt) + "." + str(n + 1)
  }
}

// 図番号のフォーマット設定
// 章番号.図番号 の形式で表示
#let image_num(_) = {
  context {
    let chapt = counter(heading).get().at(0)
    let c = counter("image-chapter" + str(chapt))
    let n = c.get().at(0)
    c.step()
    str(chapt) + "." + str(n + 1)
  }
}

// 表の基本フォーマット設定
#let tbl(tbl, caption: "") = {
  set table(
    stroke: (x, y) => {
      (
        top: if y == 0 { 1pt }
             else if y == 1 { 0.5pt }
             else { 0pt },
        bottom: 1pt
      )
    }
  )

  figure(
    tbl,  // tableコンテンツをそのまま渡す
    caption: caption,
    supplement: [表],
    numbering: table_num,
    kind: "table"
  )
}

// 画像の基本フォーマット設定
#let img(img, caption: "") = {
  figure(
    if type(img) == "content" {
      // For contents such as commutative graphs
      align(center, img)
    } else {
      // For normal images
      img
    },
    caption: caption,
    supplement: [図],
    numbering: image_num,
    kind: "image",
  )
}

#let thesis_abstract(
  title: "",
  affiliation: "",
  author: "",
  abstract: "",
  body,
  bibliography_file: none,
) = {

  show ref: it => {
    if it.element != none and it.element.func() == figure {
      let el = it.element
      let loc = el.location()
      let chapt = counter(heading).at(loc).at(0)

      link(loc)[#if el.kind == "image" or el.kind == "table" {
        let num = counter(el.kind + "-chapter" + str(chapt)).at(loc).at(0) + 1
        it.element.supplement
        " "
        str(chapt)
        "."
        str(num)
      } else if el.kind == "thmenv" {
        let thms = query(selector(<meta:thmenvcounter>))
        let number = thmcounters.at(thms.first().location()).at("latest")
        it.element.supplement
        " "
        numbering(it.element.numbering, ..number)
      } else {
        super(it)
      }]
    } else if it.element != none and it.element.func() == math.equation {
      let el = it.element
      let loc = el.location()
      let chapt = counter(heading).at(loc).at(0)
      let num = counter(math.equation).at(loc).at(0)

      it.element.supplement
      " ("
      str(chapt)
      "."
      str(num)
      ")"
    } else if it.element != none and it.element.func() == heading {
      let el = it.element
      let loc = el.location()
      let num = numbering(el.numbering, ..counter(heading).at(loc))
      if el.level == 1 {
        [#str(num).trim(".")章]  // 末尾の.をtrim()で削除
      } else if el.level == 2 {
        [#str(num).trim(".")節]  // 末尾の.をtrim()で削除
      } else if el.level == 3 {
        [#str(num).trim(".")項]  // 末尾の.をtrim()で削除
      }
    } else {
      super(it)
    }
  }

  set text(font: (
    "Times New Roman", // Windows
    // "Nimbus Roman", // Ubuntu
    // "Hiragino Mincho ProN", // Mac
    "Yu Mincho", // Windows
    // "Noto Serif CJK JP", // Ubuntu
    ), size: 10.5pt)
    // Configure the page properties.
  set page(
    paper: "a4",
    margin: (bottom: 1.75cm, top: 2.25cm),
    footer: align(center)[
      #context [#counter(page).display()]
    ]
  )

  // タイトル
  align(center)[
    #text(size: 14pt)[#title]
  ]

  v(10.5pt)  // 空行

  // 所属・氏名
  align(center)[
    #affiliation #h(0.5em) #author
  ]

  v(10.5pt)  // 空行

  // アブストラクト（1段組み）
  set par(
    justify: true,
  )
  [#abstract]

  v(1em)  // 空行


  // 本文（2段組み）
  columns(2, gutter: 1.5em)[
    #set par(
      first-line-indent: 1em,
      justify: true, // 両端揃え
      spacing: 0.5em,    // 段落間の設定
      leading: 0.5em
    )
    #set heading(
      numbering: "1.",  // ナンバリングのフォーマットを指定
    )
    #show heading.where(level: 1): it => {
      it
      counter(math.equation).update(0)
    }
    #show heading: it => {
        if it.level == 1 {
          v(-0.6em)
            it
          v(-10.5pt)
          par(text(size:0.5em, ""))
        } else {
            v(-0.6em)  // 節や項（level 2以下）の前の空白をさらに縮小
            it
            v(-10.5pt)
            par(text(size:0.5em, ""))
        }

    }
    // 数式番号を見出しと連動させる
    // 章番号.式番号 の形式で表示
    #let equation_num(_) = {
      context {
        let chapt = counter(heading).get().at(0)
        let c = counter(math.equation)
        let n = c.get().at(0)
        "(" + str(chapt) + "." + str(n) + ")"
      }
    }
    #set math.equation(supplement: [式], numbering: equation_num)
    #body
    // 参考文献
    #if bibliography_file != none {
      bibliography(bibliography_file,
        title: "参考文献",
        style: "csl/chemical-engineering-journal.csl")
    }
  ]


}






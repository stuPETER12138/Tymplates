// a simple template for 劳动教育（或其他

#let indent = h(2em)

#let sb = bibliography

#let conf(
  title: none,
  author: (),
  abstract: [],
  doc,
  bibliography: none,
) = {
  set page(
    paper: "a4",
    numbering: "1",
  )
  set par(justify: true)
  set text(
    font: "SimSun", // 宋体
    size: 12pt, // 小四号字
  )
  set align(center)
  text(
    font: "SimHei", // 黑体
    size: 16pt, // 三号字
    [*#title*])
  grid(
    columns: (1fr),
    align(center)[
      #author.name \
      #author.affiliation \
      #author.class
    ],
  )
  // show heading: block.with(inset: (left: 2em))
  // 标题缩进。block 用法，有待深入学习
  show heading: it => {
    if it.level == 1 {
      set text(14pt)
      it
    } else {
      set text(12pt)
      it
    }
  }
  set par(first-line-indent: 2em)
  set align(left)
  columns(2, {
    align(center, text(size: 14pt)[*摘要*])
    abstract

    doc

  if bibliography != none {
      set sb(
        title: [*参考文献*],
        style: "gb-7714-2005-numeric"
        )
      show sb: set text(
        size: 12pt
        )
      bibliography
    }
  })
}

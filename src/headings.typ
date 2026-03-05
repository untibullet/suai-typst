#import "constants.typ": body-size, indent

#let structural-heading-titles = (
  abstract: [Реферат],
  contents: [Содержание],
  intro: [Введение],
  conclusion: [Заключение],
  references: [Список использованных источников],
)

// Отображаются в outline без номера
#let _outlined-titles = (
  intro: [Введение],
  conclusion: [Заключение],
  references: [Список использованных источников],
)

// НЕ отображаются в outline
#let _non-outlined-titles = (
  abstract: [Реферат],
  contents: [Содержание],
)

#let structural-heading-style = it => {
  pagebreak(weak: true)
  {
    set par(first-line-indent: 0pt)
    align(center)[
      #block(above: 0em, below: 1em)[
        #text(weight: "bold", size: body-size)[#upper(it)]
      ]
    ]
  }
}

// outlined: false → не попадает в #outline()
#let structural-heading(body) = heading(level: 1, numbering: none, outlined: false)[#body]

#let headings = body => {
  set heading(numbering: "1.1")

  // Selector для Введение/Заключение/Список — в outline, без номера
  let ot = _outlined-titles.values()
  let outlined-selector = ot.slice(1).fold(
    heading.where(body: ot.at(0), level: 1),
    (acc, t) => acc.or(heading.where(body: t, level: 1))
  )
  show outlined-selector: set heading(numbering: none)

  // Selector для = Реферат / = Содержание написанных напрямую
  let nt = _non-outlined-titles.values()
  let non-outlined-selector = nt.slice(1).fold(
    heading.where(body: nt.at(0), level: 1),
    (acc, t) => acc.or(heading.where(body: t, level: 1))
  )
  show non-outlined-selector: set heading(numbering: none, outlined: false)

  // Обычные заголовки (объявлено раньше → structural-правила ниже перекрывают)
  show heading: it => {
    let above = if it.level == 1 { 0em } else { 0.5em }
    let content = block(above: above, below: 0.5em)[
      #pad(left: indent)[#text(weight: "bold", size: body-size)[#it]]
    ]
    if it.level == 1 { pagebreak(weak: true); content } else { content }
  }

  // Структурный стиль для Введение и др. (в outline) — перекрывает show heading выше
  show outlined-selector: it => structural-heading-style(it.body)

  // Структурный стиль для outlined:false — structural-heading() и = Реферат/Содержание
  show heading.where(outlined: false): it => structural-heading-style(it.body)

  body
}

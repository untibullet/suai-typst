#import "constants.typ": body-font, body-size, title-size, indent, page-margin, page-margin-title, table-size
#import "headings.typ": headings, structural-heading
#import "appendixes.typ": is-heading-in-appendix
#import "numbering.typ": heading-numbering

#let gost-heading = structural-heading

#let gost(
  title-template: none,
  organization: "ГУАП",
  department: none,
  group: none,
  subject: none,
  title: none,
  work-number: none,
  authors: none,
  teachers: none,
  position: none,
  city: none,
  date: auto,
  body,
) = {
  set page(paper: "a4", margin: page-margin-title, numbering: none)
  set text(font: body-font, size: title-size, lang: "ru", hyphenate: false)

  title-template(
    organization: organization,
    department: department,
    group: group,
    subject: subject,
    title: title,
    work-number: work-number,
    authors: authors,
    teachers: teachers,
    position: position,
    city: city,
    date: date,
  )

  pagebreak()

  set page(numbering: "1", number-align: center + bottom, margin: page-margin)
  set text(font: body-font, size: body-size, lang: "ru")
  set par(
    first-line-indent: (amount: indent, all: true),
    leading: 0.5em,
    spacing: 0.5em,
    justify: true,
  )

  show list: it => pad(left: indent, top: 0.5em, bottom: 0.5em)[#it]
  show enum: it => pad(left: indent, top: 0.5em, bottom: 0.5em)[#it]

  show: headings

  show outline.entry: it => {
    show linebreak: [ ]
    if is-heading-in-appendix(it.element) {
      if it.element.level > 1 { return none }
      let prefix = heading-numbering(counter("appendix").at(it.element.location()).first())
      link(it.element.location(), it.indented(
        none,
        [Приложение #prefix #it.element.body]
          + sym.space
          + box(width: 1fr, it.fill)
          + sym.space
          + sym.wj
          + it.page(),
      ))
    } else {
      it
    }
  }

  set figure.caption(separator: [ — ])

  show figure.where(kind: image): set figure(supplement: [Рисунок])
  show figure.where(kind: image): set figure.caption(position: bottom)

  show figure.where(kind: table): set figure(
    supplement: [#h(indent)Таблица],
    numbering: num => {
      let section = counter(heading).get().first()
      str(section) + "." + str(num)
    },
  )
  show figure.where(kind: table): set figure.caption(position: top)

  show figure.where(kind: image): it => block(inset: (top: 1em, bottom: 1em), it)
  show figure.where(kind: table): set block(breakable: true)
  show figure.where(kind: table): it => {
    align(left, block(inset: (top: 1em, bottom: 1em), it))
  }

  show table: it => {
    set text(size: table-size, hyphenate: auto)
    show "_": "_" + "\u{200B}"
    show table.cell: set block(breakable: false)
    show table.cell: set align(horizon)
    align(left, it)
  }

  body
}

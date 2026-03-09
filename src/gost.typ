#import "constants.typ": body-font, body-size, title-size, indent, page-margin, page-margin-title
#import "headings.typ": headings, structural-heading

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

  set figure.caption(separator: [ — ])

  show figure.where(kind: image): set figure(supplement: [Рисунок])
  show figure.where(kind: image): set figure.caption(position: bottom)

  show figure.where(kind: table): set figure(supplement: [Таблица])
  show figure.where(kind: table): set figure.caption(position: top)

  show figure.where(kind: image): it => block(inset: (bottom: 1em), it)
  show figure.where(kind: table): it => align(left, pad(left: indent, block(inset: (top: 1em, bottom: 1em), it)))

  body
}

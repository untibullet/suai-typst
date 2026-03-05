// Настройка страницы для всего документа и в частности для титульного листа
#set page(
  paper: "a4",
  margin: (left: 30mm, right: 15mm, top: 20mm, bottom: 20mm),
)
#set text(font: "Times New Roman", size: 12pt, lang: "ru", hyphenate: false)

// Шапка университета
#align("ГУАП", center)

#align(center, pad("КАФЕДРА №33", top: 0.85cm))

#v(2.12cm)

// Вступительная сноска
#align(left, stack(dir: ltr, "ОТЧЁТ\nЗАЩИЩЁН С ОЦЕНКОЙ"))
#align(left, pad("ПРЕПОДАВАТЕЛЬ", top: 0.21cm))

// Блок ифнормации о преподавателе — таблица 3×2
#grid(
  columns: (1.5fr, 1fr, 1.5fr),
  row-gutter: 3pt,
  column-gutter: 10pt,
  align(center, "!!!"), "", align(center, "!!!"),
  line(length: 100%, stroke: 0.5pt), line(length: 100%, stroke: 0.5pt), line(length: 100%, stroke: 0.5pt),
  align(center, text(10pt, "должность, уч.степень, звание")),
  align(center, text(10pt, "подпись, дата")),
  align(center, text(10pt, "инициалы, фамилия")),
)

#v(1em)

// Блок названия работы — таблица 1×5 (последние 2 строки пустые, увеличенные отступы)
#align(center)[
  #table(
    stroke: none,
    columns: 1fr,
    pad(top: 1.69cm)[#text(size: 14pt)[ОТЧЕТ О ЛАБОРАТОРНОЙ РАБОТЕ №!!!]],
    pad(top: 1.27cm, bottom: 1.27cm)[#text(size: 14pt)[#upper("!!!")]],
    pad(top: 0.21cm)[по курсу: #upper("!!!")],
  )
]

#v(2.96cm)

#align(left, "РАБОТУ ВЫПОЛНИЛ")

#grid(
  columns: (0.7fr, 0.7fr, 1fr, 1fr),
  column-gutter: 10pt,
  row-gutter: 3pt,
  "СТУДЕНТ гр №",
  align(center, "!!!"),
  align(center, ""),
  align(center, "!!!"),
  line(length: 0%, stroke: 0.5pt),
  line(length: 100%, stroke: 0.5pt),
  line(length: 100%, stroke: 0.5pt),
  line(length: 100%, stroke: 0.5pt),
  grid.cell(text(10pt, ""), colspan: 2),
  align(center + top, text(10pt, "подпись, дата")),
  align(center, text(10pt, "инициалы, фамилия")),
)

#align(center + bottom)[
  Санкт-Петербург #datetime.today().year()
]

#pagebreak()

#set page(
  numbering: "1",
  number-align: center + bottom,
  margin: (left: 30mm, right: 15mm, top: 20mm, bottom: 20mm),
)

#set text(
  font: "Times New Roman",
  size: 14pt,
  lang: "ru",
)

#set par(
  first-line-indent: (amount: 1.25cm, all: true),
  leading: 0.5em,
  spacing: 0.5em,
  justify: true,
)

#show list: it => { pad(left: 1.25cm, top: 0.5em, bottom: 0.5em)[#it] }
#show enum: it => { pad(left: 1.25cm, top: 0.5em, bottom: 0.5em)[#it] }

#set heading(numbering: none)

#let heading-style(it) = {
  pad(left: 1.25cm)[#text(weight: "bold", size: 14pt)[#it]]
}

#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  block(above: 0em, below: 0.5em)[#heading-style(it)]
}

#show heading.where(level: 2): it => {
  block(above: 0.5em, below: 0.5em)[#heading-style(it)]
}

#show heading.where(level: 3): it => {
  block(above: 0.5em, below: 0.5em)[#heading-style(it)]
}

#set figure.caption(separator: [ — ])

#show figure.where(kind: image): set figure(supplement: [Рисунок])
#show figure.where(kind: image): set figure.caption(position: bottom)

#show figure.where(kind: table): set figure(supplement: [Таблица])
#show figure.where(kind: table): set figure.caption(position: top)

#show figure.where(kind: image): it => block(inset: (bottom: 1em), it)
#show figure.where(kind: table): it => block(inset: (top: 1em, bottom: 1em), it)

#let gost-heading(body) = {
  pagebreak(weak: true)
  {
    set par(first-line-indent: 0pt)
    align(center)[
      #block(above: 0pt, below: 1em)[
        #text(weight: "bold", size: 14pt)[#upper(body)]
      ]
    ]
  }
}

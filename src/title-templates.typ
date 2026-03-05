#let suai-university-lab(
  organization: none,
  department: none,
  group: none,
  subject: none,
  title: none,
  authors: none,
  teachers: none,
  position: none,
  city: none,
  date: auto,
) = {
  let year = if date == auto { datetime.today().year() } else { date }

  align(upper(organization), center)

  align(center, pad(upper(department), top: 0.85cm))

  v(2.12cm)

  align(left, stack(dir: ltr, "ОТЧЁТ\nЗАЩИЩЁН С ОЦЕНКОЙ"))
  align(left, pad("ПРЕПОДАВАТЕЛЬ", top: 0.21cm))

  grid(
    columns: (1.5fr, 1fr, 1.5fr),
    row-gutter: 3pt,
    column-gutter: 10pt,
    align(center, position), "", align(center, teachers.first()),
    line(length: 100%, stroke: 0.5pt), line(length: 100%, stroke: 0.5pt), line(length: 100%, stroke: 0.5pt),
    align(center, text(10pt, "должность, уч.степень, звание")),
    align(center, text(10pt, "подпись, дата")),
    align(center, text(10pt, "инициалы, фамилия")),
  )

  v(1em)

  align(center)[
    #table(
      stroke: none,
      columns: 1fr,
      pad(top: 1.69cm)[#text(size: 14pt)[ОТЧЕТ О ЛАБОРАТОРНОЙ РАБОТЕ]],
      pad(top: 1.27cm, bottom: 1.27cm)[#text(size: 14pt)[#upper(title)]],
      pad(top: 0.21cm)[по курсу: #upper(subject)],
    )
  ]

  v(2.96cm)

  align(left, "РАБОТУ ВЫПОЛНИЛ")

  grid(
    columns: (0.7fr, 0.7fr, 1fr, 1fr),
    column-gutter: 10pt,
    row-gutter: 3pt,
    "СТУДЕНТ гр №",
    align(center, group),
    align(center, ""),
    align(center, authors.first()),
    line(length: 0%, stroke: 0.5pt),
    line(length: 100%, stroke: 0.5pt),
    line(length: 100%, stroke: 0.5pt),
    line(length: 100%, stroke: 0.5pt),
    grid.cell(text(10pt, ""), colspan: 2),
    align(center + top, text(10pt, "подпись, дата")),
    align(center, text(10pt, "инициалы, фамилия")),
  )

  align(center + bottom)[
    #city #year
  ]
}

#let suai-university-coursework(
  organization: none,
  department: none,
  group: none,
  subject: none,
  title: none,
  authors: none,
  teachers: none,
  position: none,
  city: none,
  date: auto,
) = {
  let year = if date == auto { datetime.today().year() } else { date }

  align(center)[
    МИНИСТЕРСТВО НАУКИ И ВЫСШЕГО ОБРАЗОВАНИЯ РОССИЙСКОЙ ФЕДЕРАЦИИ\
    федеральное государственное автономное образовательное учреждение высшего образования\
    #text(size: 10pt)[«САНКТ-ПЕТЕРБУРГСКИЙ ГОСУДАРСТВЕННЫЙ УНИВЕРСИТЕТ \ АЭРОКОСМИЧЕСКОГО ПРИБОРОСТРОЕНИЯ»]
  ]

  align(center, pad(upper(department), top: 0.85cm))

  v(2.12cm)

  align(left, stack(dir: ltr, "КУРСОВАЯ РАБОТА (ПРОЕКТ)\nЗАЩИЩЁНА С ОЦЕНКОЙ"))
  align(left, "ПРЕПОДАВАТЕЛЬ")

  grid(
    columns: (1.5fr, 1fr, 1.5fr),
    row-gutter: 3pt,
    column-gutter: 10pt,
    align(center, position), "", align(center, teachers.first()),
    line(length: 100%, stroke: 0.5pt), line(length: 100%, stroke: 0.5pt), line(length: 100%, stroke: 0.5pt),
    align(center, text(10pt, "должность, уч.степень, звание")),
    align(center, text(10pt, "подпись, дата")),
    align(center, text(10pt, "инициалы, фамилия")),
  )

  v(1em)

  align(center)[
    #table(
      stroke: none,
      columns: 1fr,
      pad(top: 1.27cm)[#text(size: 14pt)[ПОЯСНИТЕЛЬНАЯ ЗАПИСКА\ К КУРСОВОЙ РАБОТЕ (ПРОЕКТУ)]],
      pad(top: 1.27cm, bottom: 1.27cm)[#text(size: 14pt, weight: "bold")[#upper(title)]],
      [по дисциплине: #upper(subject)],
    )
  ]

  v(2.96cm)

  align(left, "РАБОТУ ВЫПОЛНИЛ")

  grid(
    columns: (0.7fr, 0.7fr, 1fr, 1fr),
    column-gutter: 10pt,
    row-gutter: 3pt,
    "СТУДЕНТ гр №",
    align(center, group),
    align(center, ""),
    align(center, authors.first()),
    line(length: 0%, stroke: 0.5pt),
    line(length: 100%, stroke: 0.5pt),
    line(length: 100%, stroke: 0.5pt),
    line(length: 100%, stroke: 0.5pt),
    grid.cell(text(10pt, ""), colspan: 2),
    align(center + top, text(10pt, "подпись, дата")),
    align(center, text(10pt, "инициалы, фамилия")),
  )

  align(center + bottom)[
    #city #year
  ]
}

#let title-templates = (
  suai-university-lab: suai-university-lab,
  suai-university-coursework: suai-university-coursework,
)

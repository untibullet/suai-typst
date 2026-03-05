#import "@local/suai-typst:0.1.0": gost, gost-heading, title-templates, abstract, appendixes

#show: gost.with(
  title-template: title-templates.suai-university-lab,
  organization: "ГУАП",
  department: "Кафедра №42",
  group: "1234",
  subject: "Тестовая дисциплина",
  title: "Тестовая лабораторная работа",
  authors: ("Иванов И.И.",),
  teachers: ("Петров П.П.",),
  position: "доцент, к.т.н.",
  city: "Санкт-Петербург",
)

#abstract("тестирование", "шаблон", "ГОСТ")[
  #lorem(25)
]

#gost-heading("СОДЕРЖАНИЕ")

#outline(title: none)

= Введение

#lorem(50)

= Основная часть

#lorem(30)

== Текст, списки и перечисление

#lorem(20)

Маркированный список:

- первый элемент списка
- второй элемент списка
- третий элемент списка

Нумерованный список:

+ первый шаг
+ второй шаг
+ третий шаг

#lorem(15)

== Формулы и рисунки

Пример формулы для вычисления нормы вектора:

$ ||bold(x)|| = sqrt(sum_(i=1)^n x_i^2) $

#lorem(15)

#figure(
  rect(width: 100%, height: 4cm, fill: luma(220)),
  caption: [Пример рисунка-заглушки],
)

#lorem(20)

== Таблицы

#lorem(15)

#figure(
  table(
    columns: 3,
    table.header([Параметр], [Значение], [Единица]),
    table.hline(),
    [Длина], [100], [мм],
    [Ширина], [50], [мм],
    [Высота], [25], [мм],
  ),
  caption: [Пример таблицы],
  kind: table,
)

#lorem(20)

= Заключение

#lorem(40)

= Список использованных источников

+ Иванов И.И. Введение в типографику. --- М.: Наука, 2020. --- 200~с.
+ Петров П.П. Оформление научных работ по ГОСТ. --- СПб.: Политехника, 2019. --- 80~с.

#appendixes[
  = Исходный код программы

  #lorem(30)

  #figure(
    rect(width: 100%, height: 3cm, fill: luma(220)),
    caption: [Пример вывода программы],
  )

  #lorem(15)
]

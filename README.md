# suai-typst

Шаблон оформления учебных работ (лабораторные, курсовые) по ГОСТ 7.32
для ГУАП. Реализован на [Typst](https://typst.app).

## Требования

- [Typst](https://github.com/typst/typst/releases) ≥ 0.12
- Шрифт Times New Roman (обычно входит в системные шрифты Windows/macOS;
  на Linux: `sudo apt install ttf-mscorefonts-installer`)

## Установка

```sh
git clone https://github.com/you/suai-typst
cd suai-typst
bash install.sh
```

Скрипт создаёт симлинк в директории локальных пакетов Typst.
Изменения в репозитории сразу отражаются — переустановка не нужна.

## Использование

```typst
#import "@local/suai-typst:0.1.0": gost, title-templates, abstract

#show: gost.with(
  title-template: title-templates.suai-university-lab,
  organization: "ГУАП",
  department: "Кафедра №33",
  group: "4321",
  subject: "Операционные системы",
  title: "Лабораторная работа №1",
  authors: ("Иванов И.И.",),
  teachers: ("Петров П.П.",),
  position: "доцент, к.т.н.",
  city: "Санкт-Петербург",
)

#abstract("ключевое слово", "ещё одно")[Краткое описание работы.]

#outline()

= Введение

Текст работы.

= Заключение

Выводы.
```

Компиляция:

```sh
typst compile report.typ
```

## API

| Имя | Описание |
|-----|----------|
| `gost` | Основная функция-обёртка, применяется через `#show: gost.with(...)` |
| `title-templates.suai-university-lab` | Титульный лист лабораторной работы |
| `title-templates.suai-university-coursework` | Титульный лист курсовой работы |
| `abstract(..keywords)[body]` | Реферат с автоподсчётом страниц/рисунков/таблиц |
| `appendixes[body]` | Раздел приложений (нумерация А, Б, В…) |
| `structural-heading(body)` | Структурный заголовок без номера (не попадает в содержание) |

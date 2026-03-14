#import "numbering.typ": heading-numbering
#import "constants.typ": body-size, indent

#let is-heading-in-appendix(heading) = state("appendixes", false).at(
  heading.location(),
)

#let get-element-numbering(current-heading-numbering, element-numbering) = {
  if (current-heading-numbering.first() <= 0 or element-numbering <= 0) {
    return
  }
  let current-numbering = heading-numbering(current-heading-numbering.first())
  (current-numbering, numbering("1.1", element-numbering)).join(".")
}

#let appendix-heading(status, level: 1, body) = {
  heading(level: level)[(#status)\ #body]
}

#let appendixes(content) = {
  set heading(numbering: heading-numbering, hanging-indent: 0pt)

  show heading: set align(center)
  show heading: it => {
    assert(
      it.numbering != none,
      message: "В приложениях не может быть структурных заголовков или заголовков без нумерации",
    )
    set text(size: body-size)
    set pad(left: indent)
    if it.level > 1 {
      align(left, block(above: 1em, below: 1em)[
        #pad(left: indent, [
          #numbering(
          heading-numbering,
          counter("appendix").at(it.location()).first(),
          ..counter(heading).at(it.location()).slice(1),
        ) #text(weight: "bold")[#it.body]
        ])
      ])
    }
  }

  show heading.where(level: 1): it => context {
    counter("appendix").step()
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: raw)).update(0)
    counter(math.equation).update(0)

    pagebreak(weak: true)
    set text(size: body-size)
    align(center, block(above: 0em, below: 1em)[
      #upper([приложение]) #counter("appendix").display(heading-numbering) \
      #text(size: body-size, weight: "bold")[#it.body]
    ])
  }

  set figure(numbering: it => {
    let appendix-n = counter("appendix").get().first()
    get-element-numbering((appendix-n,), it)
  })

  set math.equation(numbering: it => {
    let appendix-n = counter("appendix").get().first()
    [(#get-element-numbering((appendix-n,), it))]
  })

  state("appendixes").update(true)
  counter(heading).update(0)
  content
}

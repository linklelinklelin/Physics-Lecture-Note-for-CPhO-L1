// ============================================================================
// ClassicThesis Style for Typst
// An Homage to The Elements of Typographic Style
//
// Inspired by André Miede's ClassicThesis LaTeX template
// https://ctan.org/pkg/classicthesis
//
// Copyright (c) 2025 Adwiteey Mauriya
// Licensed under MIT License
// ============================================================================

// ----------------------------------------------------------------------------
// Colors (matching ClassicThesis)
// ----------------------------------------------------------------------------

/// Semi-transparent gray for chapter numbers
#let halfgray = luma(140)

/// Maroon for part titles
#let maroon = rgb("#800000")

/// Royal blue for links
#let royalblue = rgb("#4169E1")

/// Green for citations
#let webgreen = rgb("#008000")

/// Brown for URLs
#let webbrown = rgb("#996600")

// ----------------------------------------------------------------------------
// Font Configuration
// ----------------------------------------------------------------------------

#let ct-fonts = (
  // TeX Gyre Pagella is a Palatino clone - the authentic ClassicThesis look
  // Falls back to other serif fonts if not available
  main: ("TeX Gyre Pagella", "Libertinus Serif", "New Computer Modern", "Noto Serif SC"),
  mono: ("Fira Code", "JetBrains Mono", "DejaVu Sans Mono"),
)


// ----------------------------------------------------------------------------
// Spaced Small Caps (key ClassicThesis feature)
// ----------------------------------------------------------------------------

/// Apply letter-spaced small caps to content
#let spaced-smallcaps(content) = {
  text(tracking: 0.1em, smallcaps(content))
}

/// Apply letter-spaced all caps to content
#let spaced-allcaps(content) = {
  text(tracking: 0.15em, upper(content))
}

// ----------------------------------------------------------------------------
// Margin Notes (Graffito)
// ----------------------------------------------------------------------------

/// Add a side note in the margin
#let sidenote(content) = {
  place(
    right,
    dx: 1.5em,
    float: false,
    text(
      size: 0.85em,
      style: "italic",
      fill: luma(80),
      content,
    ),
  )
}

// ----------------------------------------------------------------------------
// Theorem Environments
// ----------------------------------------------------------------------------

#let _theorem-counter = counter("classicthesis-theorem")
#let _definition-counter = counter("classicthesis-definition")
#let _example-counter = counter("classicthesis-example")

/// A theorem block with automatic numbering
/// - title (content): Optional title for the theorem
/// - body (content): The theorem content
#let theorem(title: none, body) = {
  _theorem-counter.step()
  block(
    width: 100%,
    inset: (left: 1em, top: 0.5em, bottom: 0.5em),
    stroke: (left: 2pt + halfgray),
  )[
    #text(weight: "bold")[Theorem #context _theorem-counter.display()]
    #if title != none [ (#title)]
    #text[.] #body
  ]
}

/// A definition block with automatic numbering
/// - title (content): Optional title for the definition
/// - body (content): The definition content
#let definition(title: none, body) = {
  _definition-counter.step()
  block(
    width: 100%,
    inset: (left: 1em, top: 0.5em, bottom: 0.5em),
    stroke: (left: 2pt + maroon),
  )[
    #text(weight: "bold")[Definition #context _definition-counter.display()]
    #if title != none [ (#title)]
    #text[.] #body
  ]
}

/// An example block with automatic numbering
/// - title (content): Optional title for the example
/// - body (content): The example content
#let example(title: none, body) = {
  _example-counter.step()
  block(
    width: 100%,
    inset: (left: 1em, top: 0.5em, bottom: 0.5em),
    //    fill: luma(245),
  )[
    #text(style: "italic")[Example #context _example-counter.display()]
    #if title != none [ — #title]
    #text[.] #body
  ]
}

/// A remark block (unnumbered)
/// - body (content): The remark content
#let remark(title: none, body) = {
  block(
    width: 100%,
    inset: (left: 1em, top: 0.5em, bottom: 0.5em),
    stroke: (left: 2pt + webgreen),
  )[
    #text(style: "italic")[Remark]
    #if title != none [ — #title]
    #text[.] #body
  ]
}

/// A note block with border
/// - body (content): The note content
#let note(body) = {
  block(
    width: 100%,
    inset: 1em,
    stroke: 0.5pt + halfgray,
    radius: 2pt,
  )[
    #text(weight: "bold")[Note:] #body
  ]
}

// ----------------------------------------------------------------------------
// Part Page
// ----------------------------------------------------------------------------

/// Create a part divider page
#let part(title, preamble: none) = {
  // 确保卷页始终在右侧（奇数页）
  pagebreak(weak: true, to: "odd")

  // 放置标记，并确保它紧跟在分页之后
  [#metadata("part-marker") <ct-part-marker>]

  // 绘制内容
  v(1fr)
  align(center)[
    #text(size: 1.1em, tracking: 0.1em)[PART]
    #v(0.5em)
    #text(size: 2.2em, fill: maroon, tracking: 0.12em, smallcaps(title))
    #if preamble != none {
      v(2em)
      block(width: 75%)[
        #set par(justify: true)
        #text(size: 0.95em, preamble)
      ]
    }
  ]
  v(1fr)

  // 卷后的分页
  pagebreak(weak: true)
}

// ----------------------------------------------------------------------------
// Main Template Function
// ----------------------------------------------------------------------------

/// Apply the ClassicThesis style to a document
///
/// - title (string): The document title
/// - subtitle (string): Optional subtitle
/// - author (string): Author name
/// - date (string): Publication date
/// - paper (string): Paper size (default: "a4")
/// - lang (string): Document language (default: "en")
/// - dedication (content): Optional dedication page content
/// - abstract (content): Optional abstract content
/// - body (content): The document body
/*
#let ct-numbering(..nums) = {
  let n = nums.pos().len()
  if n == 1 { numbering("1", nums.pos().at(0)) }
  else if n == 2 { numbering("1.1", nums.pos().at(0), nums.pos().at(1)) }
  else if n == 3 { numbering("1.1.1", nums.pos().at(0), nums.pos().at(1), nums.pos().at(2)) }
  else { none }
}
*/

// 自定义编号逻辑：1, 1.1, 1.1.1
#let my-ct-numbering(..nums) = {
  let n = nums.pos().len()
  if n == 1 { numbering("1", nums.pos().at(0)) } else if n == 2 {
    numbering("1.1", nums.pos().at(0), nums.pos().at(1))
  } else if n == 3 { numbering("1.1.1", nums.pos().at(0), nums.pos().at(1), nums.pos().at(2)) } else { none }
}

#let classicthesis(
  title: "Book Title",
  subtitle: none,
  author: "Author Name",
  date: datetime.today().display("[year]"),
  paper: "a4",
  lang: "en",
  dedication: none,
  abstract: none,
  body,
) = {
  // Document metadata
  set document(title: title, author: author)

  // Page setup
  set page(
    paper: paper,
    margin: (
      inside: 3.5cm,
      outside: 2.5cm,
      top: 2.5cm,
      bottom: 3cm,
    ),
    // --- 页眉逻辑：非首页显示“标题 + 页码” ---
    header: context {
      let physical-page = here().page()
      let logical-page = counter(page).at(here()).first()

      // 1. 精准检测：当前页是否含有 一级标题 或 Part 标记
      let has-chapter-on-page = query(heading.where(level: 1)).any(it => it.location().page() == physical-page)
      let has-part-on-page = query(selector(<ct-part-marker>)).any(it => it.location().page() == physical-page)

      // 2. 状态检测：最后出现的 章节 和 卷标记
      let last-chapter = query(heading.where(level: 1).before(here())).at(-1, default: none)
      let last-part = query(selector(<ct-part-marker>).before(here())).at(-1, default: none)

      // 3. 判定是否为“过渡期”（Part 页面之后，新章节开始之前）
      let is-part-transition = false
      if last-part != none {
        if last-chapter == none or last-part.location().page() >= last-chapter.location().page() {
          is-part-transition = true
        }
      }

      // 核心修正：如果当前页有标题、有卷标，或者是过渡期，彻底隐藏页眉
      if has-chapter-on-page or has-part-on-page or is-part-transition {
        return none
      }

      // 4. 正常页眉渲染逻辑
      if last-chapter != none {
        set text(size: 0.9em)
        if calc.odd(logical-page) {
          h(1fr)
          spaced-smallcaps(last-chapter.body)
          h(2em)
          counter(page).display()
        } else {
          counter(page).display()
          h(2em)
          spaced-smallcaps(last-chapter.body)
          h(1fr)
        }
      }
    },

    // --- 页脚逻辑：起始页在中央显示页码 ---
    footer: context {
      let physical-page = here().page()
      let logical-page = counter(page).at(here()).first()

      // 同样的判定逻辑
      let last-chapter = query(heading.where(level: 1).before(here())).at(-1, default: none)
      let last-part = query(selector(<ct-part-marker>).before(here())).at(-1, default: none)
      let chapter-on-page = query(heading.where(level: 1)).find(h => h.location().page() == physical-page)

      let is-part-transition = false
      if last-part != none {
        if last-chapter == none or last-part.location().page() >= last-chapter.location().page() {
          is-part-transition = true
        }
      }

      let is-start-page = (chapter-on-page != none) or is-part-transition

      // 如果是起始页，在页脚中央显示页码
      if is-start-page {
        set text(size: 0.9em)
        align(center, counter(page).display())
      } else {
        none
      }
    },
  )
  // Typography
  set text(
    font: ct-fonts.main,
    size: 11pt,
    lang: lang,
  )

  // Paragraph settings
  // --- 2. 在这里修改段落和缩进设置 ---
  // --- A. 基础设置 ---
  set par(justify: true, leading: 0.8em, first-line-indent: 0em)
  show list: set par(first-line-indent: 0pt)
  show enum: set par(first-line-indent: 0pt)
  show table: set par(first-line-indent: 0pt)

  // 必须设置这个，查询 counter 才有数据
  set heading(numbering: my-ct-numbering)

  // --- B. 一级标题 (Chapter)：带横线 + 编号渲染 ---
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(1em)

    // 【关键步骤：手动渲染编号】
    let nums = counter(heading).at(it.location())
    let num-str = my-ct-numbering(..nums)

    block[
      #set par(first-line-indent: 0pt)
      #text(size: 20pt, weight: "bold")[
        #if num-str != "0" {
          num-str
          h(0.5em)
        }
        #it.body
      ]
    ]
    //v(0.8em)
    //line(length: 100%, stroke: 0.5pt + black)
    //v(1.5em)
  }

  // --- C. 二级标题 (Section)：编号渲染 ---
  show heading.where(level: 2): it => {
    v(1.5em)

    let nums = counter(heading).at(it.location())
    let num-str = my-ct-numbering(..nums)

    block[
      #set par(first-line-indent: 0pt)
      #text(size: 16pt, weight: "bold")[
        #if num-str != none {
          num-str
          h(0.5em)
        }
        #it.body
      ]
    ]
    v(1em)
  }

  // --- D. 三级标题 (Subsection)：编号渲染 ---
  show heading.where(level: 3): it => {
    v(1.25em)

    let nums = counter(heading).at(it.location())
    let num-str = my-ct-numbering(..nums)

    block[
      #set par(first-line-indent: 0pt)
      #text(size: 13pt, weight: "bold")[
        #if num-str != none {
          num-str
          h(0.5em)
        }
        #it.body
      ]
    ]
    v(0.75em)
  }

  // --- E. 四级标题：不编号，正文样式 ---
  show heading.where(level: 4): set heading(outlined: false)
  show heading.where(level: 4): it => {
    v(1em)
    set par(first-line-indent: 0pt)
    // 四级标题通常不需要手动渲染编号（按你之前的逻辑）
    text(size: 11pt, weight: "bold", style: "italic")[#it.body]
    h(0.5em)
  }

  // Link styling
  show link: it => text(fill: royalblue, it)

  // Inline code
  show raw.where(block: false): it => {
    box(
      fill: luma(245),
      inset: (x: 0.3em),
      radius: 2pt,
      text(font: ct-fonts.mono, size: 0.9em, it),
    )
  }

  // Code blocks
  show raw.where(block: true): it => {
    block(
      width: 100%,
      fill: luma(248),
      inset: 1em,
      radius: 2pt,
      text(font: ct-fonts.mono, size: 0.85em, it),
    )
  }

  // Figure captions
  show figure.caption: it => {
    text(size: 0.9em)[
      #text(weight: "regular")[#it.supplement #it.counter.display()]
      #it.separator
      #it.body
    ]
  }

  // Table styling
  set table(stroke: none, inset: 0.7em)
  show table: set text(size: 0.95em)

  // Footnotes
  set footnote.entry(
    separator: line(length: 30%, stroke: 0.5pt),
    indent: 0em,
  )

  // =========================================================================
  // Front Matter
  // =========================================================================

  // Title Page
  page(
    margin: (x: 2.5cm, y: 2.5cm),
    header: none,
    footer: none,
  )[
    #v(1fr)
    #align(center)[
      #text(size: 2.5em, tracking: 0.15em, upper(title))
      #if subtitle != none {
        v(1em)
        text(size: 1.3em, style: "italic", subtitle)
      }
      #v(3em)
      #text(size: 1.2em, spaced-smallcaps(author))
      #v(2em)
      #text(size: 1em, date)
    ]
    #v(1fr)
  ]

  // Back of title page (blank)
  pagebreak()
  page(header: none, footer: none)[]

  // Dedication (if provided)
  if dedication != none {
    page(header: none, footer: none)[
      #v(1fr)
      #align(right)[
        #text(style: "italic", dedication)
      ]
      #v(1fr)
    ]
    pagebreak()
  }

  // Abstract (if provided)
  if abstract != none {
    page(header: none, footer: none)[
      #heading(outlined: false, numbering: none)[Foreword]
      #v(1em)
      #abstract
    ]
    pagebreak()
  }

  // Table of Contents
  page(header: none, footer: none)[
    #heading(outlined: false, numbering: none)[Contents]
    #v(1em)
    #outline(title: none, indent: 1.5em)
  ]
  pagebreak()

  // =========================================================================
  // Main Content
  // =========================================================================
  counter(page).update(0)
  body
}

#part(
  "附录",
  preamble: [
    This part introduces the fundamentals. You can add a preamble
    to each part that appears on the part title page.
  ]
)

= Introduction测试

This is your first chapter. ClassicThesis uses spaced small caps for
chapter and section headings, following the typographic principles
outlined in Robert Bringhurst's _The Elements of Typographic Style_.

== Your First Section

Here's some example text. Notice how the section heading uses
elegant spaced small caps.

=== A Subsection

Subsections use italic text for a subtle hierarchy.

#definition(title: "Important Concept")[
  A definition block with a distinctive left border. Use this to
  define key terms in your work.
]

#theorem(title: "Main Result")[
  A theorem block for stating important results. The numbering
  is automatic.
]

#example(title: "Practical Application")[
  An example block with a subtle gray background. Use this to
  illustrate concepts with concrete examples.
]

#remark()[
  A remark block for additional observations or notes that don't
  fit the formal structure of theorems and definitions.
]

== Code Examples

Inline code looks like `this`, and code blocks are formatted cleanly:

```python
def hello_world():
    """A simple function."""
    print("Hello, ClassicThesis!")
```

== Tables and Figures

#figure(
  table(
    columns: (auto, auto, auto),
    table.header([*Item*], [*Description*], [*Value*]),
    [Alpha], [First item], [100],
    [Beta], [Second item], [200],
    [Gamma], [Third item], [300],
  ),
  caption: [A sample table with clean styling.],
)

// ============================================================================
// Part II
// ============================================================================

#part("Advanced Topics")

= Another Chapter

Continue your document with more chapters. Each chapter starts
on a new page with the elegant ClassicThesis heading style.

== References and Citations

Add your bibliography and citations as needed.

= Conclusion

Wrap up your work with a conclusion chapter.

// 仅针对接下来这一页开启边框
#set page(background: {
  // place 用于精确定位
  place(center + horizon)[
    #rect(
      width: 100% - 2cm,  // 宽度减去两边的留白
      height: 100% - 2cm, // 高度减去上下的留白
      stroke: 1pt + black 
    )
  ]
})

=== 这一页会有边框
内容会自动排列在边框内部 . 

// 如果下一页不想有边框，记得在页码末尾改回来
#pagebreak()
#set page(background: none)
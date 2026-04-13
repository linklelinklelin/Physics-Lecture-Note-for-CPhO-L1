// --- 1. 正文水印设置 ---

#let watermark(content) = {
  // 设置全局水印样式
  set text(
    font: "Noto Sans SC",
    fill: rgb(200, 200, 200, 15%), // 降低透明度，适合多行平铺
    size: 40pt, // 多行水印建议尺寸稍小
    weight: "bold",
  )

  // 放置一个旋转的容器
  place(
    center + horizon,
    rotate(-45deg, block(
      width: 150%, // 容器比页面大，防止旋转后边缘空白
      height: 150%,
      // 使用 grid 实现多行多列平铺
      grid(
        columns: (1fr, 1fr, 1fr), // 三列
        rows: (1fr, 1fr, 1fr, 1fr, 1fr), // 五行
        align: center + horizon,
        gutter: 40pt, // 水印之间的间距
        // 重复生成内容
        ..array.range(15).map(_ => content)
      ),
    )),
  )
}

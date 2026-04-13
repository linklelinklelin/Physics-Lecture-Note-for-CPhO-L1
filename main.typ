#import "format/lib.typ":*
#import "format/utils.typ":*
#import "format/watermark.typ":*

#show: apply-settings
#show math.equation: it => {
  set text(font: ("New Computer Modern Math", ..ct-fonts.main))
  show regex("[\u4e00-\u9fa5]+"): set text(style: "normal")
  it
}


#set page(
  // 如果有图片或深色背景，建议用 foreground
  foreground: watermark([2604 崔佳乐]),
)


#show: classicthesis.with(
  title: "物理竞赛简明讲义",
  subtitle: "CPhO 一轮用书",
  author: "王舶浩",
  date: "2026.04",
  // Optional: dedication and abstract
  dedication: [本书以 CC BY-NC-ND 4.0 协议进行发布 ,
  
  即允许下载和分享作品 , 但必须注明作者 ,
  
  且不得未经准许进行任何形式的修改或用于商业目的 . 
  
  ©2026 https://github.com/linklelinklelin/Mechanics-Lecture-Notes-for-CPhO-L2 .

 献给我的学生与挚友们 . ],
  // abstract: [This is the abstract of your work...],
)

// --- 文档开始 ---

//========================================================================
// Part I
// ==========================================================================
#part(
  "力学进阶：复杂系统与约束
  Force and Motion",
  preamble:[
    本部分将建立起经典力学的核心框架 . 
    
    这部分内容旨在回答一个基本问题：物体如何运动，以及为何如此运动？
  ]
)

#pagebreak(to: "odd")

= 振动

#include "chapters/牛顿力学/简谐振动.typ"
#include "chapters/牛顿力学/受迫与阻尼.typ"

= 刚体
#include "chapters/牛顿力学/刚体动力学.typ"

= 万有引力
#include "chapters/牛顿力学/万有引力.typ"

= 静电学
#include "chapters/静电学/静电学基础.typ"
#include "chapters/静电学/高斯定理.typ"
#include "chapters/静电学/电势能.typ"
#include "chapters/静电学/导体.typ"


#pagebreak(to: "odd")


#part(
  "附录",
  preamble: [
    本部分系统梳理了学习本讲义所需的数学预备知识，涵盖从初等数学到微积分的核心内容 . 它们是理解和表述物理规律不可或缺的工具 . 
  ]
)

#include "chapters/appendixMath.typ"



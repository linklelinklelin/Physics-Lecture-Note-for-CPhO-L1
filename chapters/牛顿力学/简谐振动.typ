#import "../../format/lib.typ":*
#import "../../format/utils.typ":*

== 简谐振动

简谐振动是动力学系统在稳定平衡位置附近最简单、最基本的运动形式 . 当一个系统所受的回复力与偏离平衡位置的位移成正比时，其运动规律便完全由一个二阶线性微分方程统治 . 

=== 简谐振动的微分方程与解

#theorem(title: "动力学方程的建立")[
  设质点偏离平衡位置的位移为 $x$，受到的回复力为 $F = -k x$ . 根据牛顿第二定律 $F = m ddot(x)$，有：
  $ m ddot(x) + k x = 0 arrow.long ddot(x) + k/m x = 0 $
  令 $omega_0^2 = k/m$，得到简谐振动的标准方程：
  $ ddot(x) + omega_0^2 x = 0 $
]

- *微分方程的推导解*：
  这是一个常系数齐次线性微分方程 . 尝试解 $x = e^(r t)$，代入得 $r^2 + omega_0^2 = 0$，解得 $r = plus.minus i omega_0$ . 根据叠加原理，其通解为：
  $ x(t) = C_1 e^(i omega_0 t) + C_2 e^(-i omega_0 t) $
  利用欧拉公式 $e^(i theta) = cos theta + i sin theta$，并考虑 $x(t)$ 必须为实数，通解可写为：
  $ x(t) = A cos(omega_0 t + phi) $

- *物理量的确定*：
  1. *固有角频率* $omega_0 = sqrt(k/m)$：仅由系统固有性质（$m, k$）决定 . 

  2. *振幅 $A$ 与初相 $phi$*：由初始条件 $x_0$ 和 $v_0$ 决定 . 
     $ x_0 = A cos phi, quad v_0 = -A omega_0 sin phi arrow.long cases(A = sqrt(x_0^2 + (v_0 / omega_0)^2), phi = arctan(- v_0 / (omega_0 x_0))) $

=== 能量法分析

#remark()[
  对于复杂的系统，受力分析往往需要处理约束力和内力 . 利用机械能守恒定律可以避开这些复杂运算，直接得到 $omega_0$ . 
]

设系统的总机械能为 $E = E_k + E_p$ . 

1. 写出能量表达式：$E = 1/2 m_("eff") dot(x)^2 + 1/2 k_("eff") x^2$ . 

2. 对时间 $t$ 求导：$dif/dt E = 0$（守恒系统） . 
3. 得到 $m_("eff") dot(x) ddot(x) + k_("eff") x dot(x) = 0$ . 
4. 约去 $dot(x)$，直接提取标准方程：$ddot(x) + k_("eff")/m_("eff") x = 0$ . 

=== 相量法 (Phasor Method)

在物理学与工程学中，为了简化周期性函数的运算，我们将简谐振动视为复平面上一个旋转的矢量，称为*相量* . 

- *复数表示*：
  将位移 $x(t)$ 视为复函数 $tilde(x)(t) = A e^(i(omega_0 t + phi))$ 的实部：
  $ x(t) = Re{ A e^(i(omega_0 t + phi)) } $

- *极坐标形式* $r angle theta$：
  在特定时刻（如 $t=0$），我们可以将振动状态简记为：
  $ tilde(X) = A angle phi $
  这里 $A$ 为矢量的模（振幅），$phi$ 为辐角（初相位） . 这种 $r angle theta$ 的形式在处理多个振动合成时表现出极强的代数优势 . 

- *导数的几何意义*：
  $ dot(tilde(x)) = i omega_0 tilde(x) = omega_0 A e^(i(omega_0 t + phi + pi/2)) arrow.long dot(tilde(X)) = omega_0 A angle (phi + pi/2) $
  $ ddot(tilde(x)) = -omega_0^2 tilde(x) = omega_0^2 A e^(i(omega_0 t + phi + pi)) arrow.long ddot(tilde(X)) = omega_0^2 A angle (phi + pi) $
  即在复平面上，每求导一次，相量逆时针旋转 $pi/2$，模值乘以 $omega_0$ . 

=== 简谐振动的合成

==== 同方向、同频率的合成
设 $x_1 = A_1 cos(omega_0 t + phi_1)$，$x_2 = A_2 cos(omega_0 t + phi_2)$ . 
对应的相量为 $tilde(X)_1 = A_1 angle phi_1$ 和 $tilde(X)_2 = A_2 angle phi_2$ . 

#theorem(title: "相量合成法则")[
  合振动的相量 $tilde(X) = tilde(X)_1 + tilde(X)_2$ . 
  利用复数的矢量加法（或余弦定理）：
  $ A^2 = A_1^2 + A_2^2 + 2 A_1 A_2 cos(phi_2 - phi_1) $
  $ tan phi = (A_1 sin phi_1 + A_2 sin phi_2) / (A_1 cos phi_1 + A_2 cos phi_2) $
]

==== 互相垂直的简谐振动
1. *频率相同*：质点轨迹一般为椭圆 . 当相位差 $Delta phi = 0$ 或 $pi$ 时，退化为直线；当 $Delta phi = plus.minus pi/2$ 且 $A_1 = A_2$ 时，为圆运动 . 

2. *频率不同*：合成轨迹称为*李萨如图形 (Lissajous figures)* . 轨迹的封闭性取决于两个频率的比值是否为有理数 . 

=== 典型力学模型

- *单摆的小角振动*

  摆长为 $L$ 的单摆，受重力 $m g$ 和绳拉力 $T$ . 沿切向的回复力为：
  $ F_t = -m g sin theta $
  当 $theta$ 很小时（$theta < 5^o$），$sin theta approx theta approx x/L$ . 
  则 $F_t = -m g / L x$ . 
  代入标准方程得 $ddot(x) + g/L x = 0$，故角频率 $omega_0 = sqrt(g/L)$ . 


- *复摆（刚体微振动）*

  质量为 $m$ 的刚体绕固定轴 $O$ 转动，转动惯量为 $I$，质心到轴的距离为 $d$ . 
  根据转动定律 $M = I alpha$：
  $ I ddot(theta) = -m g d sin theta approx -m g d theta $
  整理得标准方程：$ddot(theta) + (m g d) / I theta = 0$ . 
  固有角频率为 $omega_0 = sqrt((m g d) / I)$ . 

#pagebreak()

#example(title: "柱形槽内实心圆柱的往复运动分析")[
  图为一截面。在水平桌面上，放一下方平整，上方曲率半径为 $R$ 的柱形槽。槽上一质量为 $m$（均匀分布）、半径为 $r$ 的实心圆柱。$R > r$，初始圆柱在槽正上方，重力加速度为 $g$。

  (1) 槽固定，圆柱和槽光滑接触。给圆柱一微小扰动，求其运动周期。

  (2) 槽固定，圆柱和槽的接触足够粗糙。给圆柱一微小扰动，求其运动周期。

  (3) 槽（质量为 $M$）与桌面光滑接触，圆柱和槽的接触足够粗糙。系统受微小扰动，初始状态如下：槽瞬时静止，圆柱有顺时针方向微小角速度 $omega_0$。

  #set par(first-line-indent: 2em)
  (3.1) 求圆柱与槽相对运动的周期。

  (3.2) 求槽运动的平均速度。

  #align(right)[
    #block(width: 45%)[
      #figure(
        image("image\方圆联考2.png", width: 100%),
      )
    ]
  ]
]

#pagebreak()
#import "../../format/lib.typ":*
#import "../../format/utils.typ":*

== 阻尼振动与受迫振动

=== 阻尼振动

当物体在介质中运动时，会受到阻力的作用 . 在速度较小时，阻力通常与速度成正比，即 $vec(f) = -b vec(v)$，其中 $b$ 称为阻尼常数 . 

==== 运动方程的建立与求解

根据牛顿第二定律，考虑回复力 $-k x$ 和阻力 $-b dot(x)$，动力学方程为：
$ m ddot(x) = -k x - b dot(x) arrow.long m ddot(x) + b dot(x) + k x = 0 $

为了简化方程，引入阻尼参数 $beta = b / (2 m)$ 和固有角频率 $omega_0 = sqrt(k / m)$，方程化为标准形式：
$ ddot(x) + 2 beta dot(x) + omega_0^2 x = 0 $

这是一个二阶常系数齐次线性微分方程 . 我们尝试解 $x = e^(r t)$，代入方程得特征方程：
$ r^2 + 2 beta r + omega_0^2 = 0 $
$ r_(1, 2) = -beta plus.minus sqrt(beta^2 - omega_0^2) $

==== 物理性质的分类讨论

根据 $beta$ 与 $omega_0$ 的大小关系，系统的运动状态分为三类：

1. *欠阻尼 (Underdamped)*：$beta < omega_0$ . 

   此时特征根为一对共轭复数 $r = -beta plus.minus i omega'$，其中 $omega' = sqrt(omega_0^2 - beta^2)$ . 

   利用欧拉公式，方程的通解为：

   $ x(t) = A_0 e^(-beta t) cos(omega' t + phi) $
   系统的振幅按指数规律 $e^(-beta t)$ 衰减，振动频率 $omega'$ 略小于固有频率 $omega_0$ . 

2. *过阻尼 (Overdamped)*：$beta > omega_0$ . 

   此时特征根为两个不等的负实根 $r_1, r_2$ . 

   解的形式为：$ x(t) = C_1 e^(r_1 t) + C_2 e^(r_2 t) $
   系统由于阻力过大，不再发生振动，而是缓慢滑回平衡位置 . 

3. *临界阻尼 (Critically Damped)*：$beta = omega_0$ . 

   特征根为重根 $r = -beta$ . 
   解的形式为：$ x(t) = (C_1 + C_2 t) e^(-beta t) $ 这是系统不发生振动且回到平衡位置最快的状态 . 

=== 受迫振动

当振动系统受到一个周期性外力 $F(t) = F_0 cos(omega t)$ 作用时，称为受迫振动 . $omega$ 是外力的角频率，也称为驱动频率 . 

==== 非齐次方程的稳态解

系统的运动方程为：
$ m ddot(x) + b dot(x) + k x = F_0 cos(omega t) arrow.long ddot(x) + 2 beta dot(x) + omega_0^2 x = f_0 cos(omega t) $
其中 $f_0 = F_0 / m$ . 该方程的解由两部分组成：齐次方程的通解（随时间衰减的暂态过程）和非齐次方程的特解（稳态响应） . 我们重点研究长期存在的稳态响应 . 

==== 相量法辅助求解步骤

利用相量法将实数方程拓展到复平面 . 令位移为复数 $tilde(x)$，驱动力为 $f_0 e^(i omega t)$：
$ ddot(tilde(x)) + 2 beta dot(tilde(x)) + omega_0^2 tilde(x) = f_0 e^(i omega t) $

设特解形式为 $tilde(x) = tilde(A) e^(i omega t)$，其中复振幅 $tilde(A)$ 包含了振幅 $A$ 和相对于外力的相位滞后 $alpha$ . 将其对时间求导：
$ dot(tilde(x)) = i omega tilde(A) e^(i omega t), quad ddot(tilde(x)) = -omega^2 tilde(A) e^(i omega t) $

代入方程并约去 $e^(i omega t)$：
$ (-omega^2 + i 2 beta omega + omega_0^2) tilde(A) = f_0 $
解得复振幅：
$ tilde(A) = f_0 / ((omega_0^2 - omega^2) + i 2 beta omega) $

我们可以将 $tilde(A)$ 写成极坐标形式 $A angle (-alpha)$：
1. *响应振幅* $A$：

$ A = |tilde(A)| = f_0 / sqrt((omega_0^2 - omega^2)^2 + (2 beta omega)^2) $
2. *相位滞后* $alpha$：
$ tan alpha = (2 beta omega) / (omega_0^2 - omega^2) $

=== 共振现象

稳态振动的振幅 $A$ 是驱动频率 $omega$ 的函数 . 

- *位移共振*：当驱动频率 $omega$ 满足一定条件时，$A$ 达到最大值 . 
  令分母中的根号式最小，通过对 $omega$ 求导可得共振频率：
  $ omega_r = sqrt(omega_0^2 - 2 beta^2) $
  如果阻尼系数 $beta$ 极小，则 $omega_r approx omega_0$ . 

- *共振曲线与阻尼*：
  - 若阻尼很小，共振峰非常尖锐，且相位滞后 $alpha$ 在 $omega_0$ 附近从 $0$ 到 $pi$ 剧烈变化 . 
  - 当驱动频率极高（$omega >> omega_0$）时，振幅 $A arrow 0$，位移几乎与外力反向 . 


#remark()[
  在受迫振动达到稳态后，驱动力在一个周期内提供的能量，正好等于阻尼力在一个周期内消耗的能量 . 这种能量的动态平衡维持了系统恒定的振幅运动 . 
]

#pagebreak()

#example(title: "多质点受迫振动系统的特征频率分析")[

  如图，质量均为 $m$ 的三个滑块放置在光滑水平桌面上，彼此以原长为 $x_0$、劲度系数为 $k$ 的二个相同弹簧连接起来。开始时三滑块静止，滑块 $A$ 位于原点 $O$，两弹簧均为原长。对滑块 $A$ 施以周期性外力 $F$，已知 $F = F_0 cos omega t$，在水平方向并沿三滑块连线。试求振动系统的特征频率，并写出滑块 $C$ 的运动方程。

  #align(right)[
    #block(width: 55%)[
      #figure(
        image("image/难题精编7-32.png", width: 100%),
      )
    ]
  ]
]



#pagebreak()

== 无阻尼受迫振动

当简谐振子受到一个周期性外力 $F(t) = F_0 cos(omega t)$ 作用且不考虑介质阻力时，系统的动力学行为由非齐次线性微分方程描述 . 

=== 运动方程的建立

根据牛顿第二定律，合力为回复力与驱动力的矢量和：
$ m ddot(x) = -k x + F_0 cos(omega t) $
整理得标准形式：
$ ddot(x) + omega_0^2 x = f_0 cos(omega t) $
其中 $omega_0 = sqrt(k/m)$ 为固有角频率，$f_0 = F_0 / m$ 为单位质量的受力振幅 . 

=== 数学推导：算子法与特解

该方程的通解由齐次方程的通解 $x_h$ 和非齐次方程的一个特解 $x_p$ 组成：
$ x(t) = x_h (t) + x_p (t) = C_1 cos(omega_0 t) + C_2 sin(omega_0 t) + x_p (t) $

#theorem(title: "稳态解（特解）的推导")[
  假设特解的形式与驱动力同步，令 $x_p (t) = A cos(omega t)$ . 
  将其代入微分方程：
  $ -omega^2 A cos(omega t) + omega_0^2 A cos(omega t) = f_0 cos(omega t) $
  消去 $cos(omega t)$ 得到振幅 $A$ 的代数式：
  $ A (omega_0^2 - omega^2) = f_0 arrow.long A = f_0 / (omega_0^2 - omega^2) $
]

因此，在 $omega eq.not omega_0$ 时，无阻尼受迫振动的稳态解为：
$ x_p (t) = f_0 / (omega_0^2 - omega^2) cos(omega t) $

=== 相量分析与 $r angle theta$ 表示

利用相量法，我们可以更直观地观察位移对驱动力的响应相位 . 

- *相量表示*：
  设驱动力的相量为 $tilde(F) = f_0 angle 0$ . 
  根据位移相量 $tilde(X) = A angle phi$，由于无阻尼，位移只能与力同向或反向 . 
  
- *相位响应的突变*：
  1. 当 $omega < omega_0$ 时：
     $A > 0$，位移相量为 $tilde(X) = f_0 / (omega_0^2 - omega^2) angle 0$ . 
     此时位移与驱动力*同相*，系统处于“力控”状态 . 
  2. 当 $omega > omega_0$ 时：
     $A < 0$，在相量表示中，负号代表 $pi$ 的相位差：
     $ tilde(X) = | f_0 / (omega_0^2 - omega^2) | angle pi $
     此时位移与驱动力*反相*（相位滞后 $pi$），系统处于“惯性控制”状态 . 

#remark()[
  在无阻尼情况下，相位的变化是瞬时跳变的：在过共振点 $omega_0$ 的瞬间，相位从 $0$ 直接跳变到 $pi$ . 这反映了系统惯性在高频下对驱动力的迟滞响应 . 
]

=== 共振与无限大振幅

当驱动频率 $omega arrow omega_0$ 时，振幅 $A arrow infinity$ . 

- *物理意义*：在无阻尼理想模型中，外界能量源源不断地输入系统而无处耗散，导致能量密度无限堆积 . 
- *数学失效*：当 $omega = omega_0$ 时，原先假设的 $A cos(omega t)$ 形式失效 . 此时方程变为共振状态，其特解形式转变为：
  $ x_p (t) = f_0 / (2 omega_0) t sin(omega_0 t) $
  此时振幅随时间 $t$ 线性增长，这解释了为何现实系统在共振时极易发生结构破坏 . 

=== 暂态与稳态的叠加：拍 (Beats)

如果我们在 $t=0$ 时刻以静止状态释放受迫振子，总解为：
$ x(t) = f_0 / (omega_0^2 - omega^2) (cos(omega t) - cos(omega_0 t)) $
利用和差化积公式：
$ x(t) = [ (2 f_0) / (omega_0^2 - omega^2) sin( (omega_0 - omega) / 2 t ) ] sin( (omega_0 + omega) / 2 t ) $

#remark()[
  当 $omega approx omega_0$ 时，上述方程描述了*拍*现象 . 方括号中的项可以看作是一个随时间缓慢变化的“包络振幅”，其变化频率为 $|omega_0 - omega| / 2$ . 这种现象在调琴或干涉测量中非常重要 . 
]

#pagebreak()
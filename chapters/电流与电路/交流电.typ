#import "../../format/lib.typ":*
#import "../../format/utils.typ":*

== 交流电与相量分析

=== 正弦交流电的基本量

随时间按正弦规律变化的电流、电压统称为正弦交流电 . 以电压为例，其瞬时值表达式为：
$ u(t) = U_m cos(omega t + phi_u) $

#definition(title: "交流电的三要素")[
  1. *幅值 (Amplitude) $U_m$*：波峰的最大偏离量 . 
  2. *角频率 (Angular Frequency) $omega$*：描述变化的快慢，$omega = 2 pi f = (2 pi) / T$ . 
  3. *初相位 (Initial Phase) $phi_u$*：决定 $t=0$ 时刻波形的状态 . 
]

- *有效值 (RMS Value)*：由于交流电瞬时功率随时间变化，物理学中利用“热效应等效”定义有效值 . 
  $ U = sqrt(1 / T integral_0^T u^2 (t) dif t) = U_m / sqrt(2) $
  同理，$I = I_m / sqrt(2)$ . 在无特殊说明的情况下，电路设备的额定值及仪表读数均为有效值 . 

=== 交流电路中的基本元件

在交流电下，电阻、电感、电容表现出完全不同的相位特性 . 

1. *纯电阻电路*：$u = R i$ . 电压与电流*同相* . 
2. *纯电感电路*：$u = L (dif i) / (dif t)$ . 
   若 $i = I_m cos omega t$，则 $u = L omega I_m cos(omega t + pi/2)$ . 
   电压超前电流 $pi/2$ . 定义感抗 $X_L = omega L$ . 
3. *纯电容电路*：$i = C (dif u) / (dif t)$ . 
   若 $u = U_m cos omega t$，则 $i = C omega U_m cos(omega t + pi/2)$ . 
   电压滞后电流 $pi/2$ . 定义容抗 $X_C = 1 / (omega C)$ . 

=== 相量法 (Phasor Method)

#remark()[
  为了避免在 KVL 方程中处理复杂的三角函数和差化积，我们将正弦量映射到复平面上，利用复数的旋转性质进行计算 . 
]

==== 相量表示与旋转算子
我们将正弦电压 $u(t) = U_m cos(omega t + phi_u)$ 对应到一个复数 $tilde(U)$，称为电压相量：
$ tilde(U) = U angle phi_u = U e^(j phi_u) $
注意：相量仅包含振幅（或有效值）和初相位信息，而默认全电路频率 $omega$ 一致 . 

==== 复阻抗 (Complex Impedance)
在复数域中，欧姆定律可以统一写为 $tilde(U) = Z tilde(I)$ . 这里的 $Z$ 称为复阻抗：
- *电阻*：$Z_R = R$
- *电感*：$Z_L = j omega L = X_L angle 90^o$
- *电容*：$Z_C = 1 / (j omega C) = -j X_C = X_C angle (-90^o)$

#theorem(title: "复数域的电路定律")[
  引入相量和复阻抗后，基尔霍夫定律（KCL, KVL）及所有直流电路的等效定理（分压、并联、戴维南等）在形式上完全保持不变，只需将标量替换为复数即可：
  $ sum tilde(I) = 0 , quad sum tilde(U) = 0 , quad Z_("eq") = sum Z_i $
]

=== 交流电路的功率

由于电压和电流存在相位差 $phi = phi_u - phi_i$，能量的交换变得复杂 . 

1. *有功功率 (Active Power)*：电阻消耗的实际功率 . 
   $ P = U I cos phi $
   其中 $cos phi$ 称为*功率因素* . 
2. *无功功率 (Reactive Power)*：电感电容与电源交换而不消耗的能量密度 . 
   $ Q = U I sin phi $
3. *视在功率 (Apparent Power)*：电源的总容量 $S = U I = sqrt(P^2 + Q^2)$ . 

=== 三相交流电初步

在电力输送和大型电机中，我们通常使用对称的*三相四线制*系统 . 

#definition(title: "对称三相电源")[
  由三个频率相同、幅值相等、初相位互差 $120^o$ 的电压源组成的系统 . 
  $ tilde(U)_A = U_p angle 0^o, quad tilde(U)_B = U_p angle (-120^o), quad tilde(U)_C = U_p angle 120^o $
]

- *星形联结 (Y-connection)*：
  - 各相电源的一端连在一起形成中性点 $N$ . 
  - *线电压*（线与线之间）$U_L$ 与*相电压*（线与中性点间）$U_p$ 的关系为：
    $ U_L = sqrt(3) U_p $
    线电压在相位上超前对应相电压 $30^o$ . 
  - *线电流* $I_L$ 等于*相电流* $I_p$ . 

- *三角形联结 (Delta-connection)*：
  - 电源首尾相连形成闭合回路 . 
  - 线电压等于相电压：$U_L = U_p$ . 
  - 线电流与相电流的关系为：$I_L = sqrt(3) I_p$（线电流滞后相电流 $30^o$） . 

#remark()[
  对于对称三相系统，三相总功率恒定不变，不随时间波动，且中性线电流为零 . 这使得三相电机运行异常平稳，也是现代工业电网的核心 . 
]


#pagebreak()
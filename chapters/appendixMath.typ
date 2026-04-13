#import "../format/utils.typ":*
= 附录I：数学基础

== 微积分基础

=== 导数

==== 导数的定义
设函数 $y = f(x)$，当自变量从 $x_0$ 变化到 $x_1$ 时，函数值的改变量为 $Delta y = f(x_1) - f(x_0)$，自变量的改变量为 $Delta x = x_1 - x_0$ . 函数值关于自变量的平均变化率为：

$ (Delta y) / (Delta x) = (f(x_1) - f(x_0)) / (x_1 - x_0) $

当 $Delta x -> 0$（即 $x_1 -> x_0$）时，如果平均变化率趋于一个固定值，则该值称为函数在点 $x_0$ 处的瞬时变化率，即导数 . 记作：

$ f'(x_0) = lim_(Delta x -> 0) (f(x_0 + Delta x) - f(x_0)) / (Delta x) $

如果函数在区间 $(a, b)$ 内每一点都可导，则导函数为：

$ f'(x) = lim_(Delta x -> 0) (f(x + Delta x) - f(x)) / (Delta x) $

==== 切线的定义与导数的几何意义
如图，设点 $A(x_0, f(x_0))$ 和点 $B(x_0 + Delta x, f(x_0 + Delta x))$ 是曲线 $y = f(x)$ 上的点，则直线 AB 称为曲线在点 A 处的一条割线，其斜率为平均变化率 $Delta y / Delta x$ . 当 $Delta x -> 0$ 时，点 B 沿曲线趋于点 A，割线 AB 绕点 A 转动趋于直线 $l$ . 直线 $l$ 与曲线在点 A 处相切，称为曲线在点 A 处的切线 . 

导数的几何意义：函数 $y = f(x)$ 在点 $x_0$ 处的导数 $f'(x_0)$ 是曲线在点 $(x_0, f(x_0))$ 处切线的斜率 . 切线方程为：

$ y - f(x_0) = f'(x_0)(x - x_0) $

==== 导数公式表
常用函数的导数公式（三角函数自变量单位为弧度）：

#align(center, table(
  columns: (auto, auto),
  inset: 10pt,
  align: center + horizon,
  stroke: none,
  table.hline(y: 0, stroke: 1.5pt),
  table.header([*函数*], [*导函数*]),
  table.hline(y: 1, stroke: 0.5pt),
  [$y = c$（常数）], [$y' = 0$],
  [$y = x^alpha$（$alpha in RR$）], [$y' = alpha x^(alpha-1)$],
  [$y = a^x$（$a > 0, a != 1$）], [$y' = a^x ln a$；$(e^x)' = e^x$],
  [$y = log_a x$（$a > 0, a != 1$）], [$y' = 1 / (x ln a)$；$(ln x)' = 1 / x$],
  [$y = sin x$], [$y' = cos x$],
  [$y = cos x$], [$y' = -sin x$],
  [$y = tan x$], [$y' = 1 / cos^2 x$],
  [$y = cot x$], [$y' = -1 / sin^2 x$],
  table.hline(stroke: 1.5pt),
))

==== 导数的运算法则
- *加法与减法法则*：
$ [f(x) plus.minus g(x)]' = f'(x) plus.minus g'(x) $
- *乘法法则*：
$ [f(x)g(x)]' = f'(x)g(x) + f(x)g'(x) $
- *除法法则*（$g(x) != 0$）：
$ [f(x)/g(x)]' = (f'(x)g(x) - f(x)g'(x)) /( g^2(x)) $
- *数乘法则*（$k$ 为常数）：
$ [k f(x)]' = k f'(x) $

==== 复合函数求导法则
设 $y = f(u)$ 和 $u = phi(x)$，则复合函数 $y = f(phi(x))$ 的导数为：
$ y' = f'(u) phi'(x) $

求导步骤：选定中间变量，分步求导（先对中间变量求导，再对自变量求导），最后代回原变量 . 

==== 导数的实际意义
- *功率*：功关于时间的导数

- *瞬时速度*：位移关于时间的导数；加速度是速度关于时间的导数
- *线密度*：质量关于长度的导数

=== 定积分

==== 定积分的定义
设函数 $y = f(x)$ 在区间 $[a, b]$ 上有定义 . 将区间分割为 $n$ 个小区间，分点为 $a = x_0 < x_1 < dots < x_n = b$，第 $i$ 个小区间长度为 $Delta x_i$ . 在每个小区间上取点 $xi_i$，作和式：

$ S = sum_(i=1)^n f(xi_i) Delta x_i $

当最大小区间长度趋于 0 时，如果和式 $S$ 趋于固定常数 $A$，则称 $A$ 为函数在 $[a, b]$ 上的定积分，记作：

$ integral_a^b f(x) dx = A $

其中 $a$ 为积分下限，$b$ 为积分上限 . 

==== 定积分的几何意义与物理意义

- *几何意义*：当 $f(x) >= 0$ 时，定积分 $integral_a^b f(x) dx$ 表示曲线 $y = f(x)$ 与直线 $x = a$、$x = b$ 及 $x$ 轴所围曲边梯形的面积

- *物理意义*：当 $f(x)$ 表示速度关于时间的函数时，定积分表示物体从时间 $a$ 到 $b$ 的位移

==== 定积分的性质

1. $integral_a^b 1 dx = b - a$

2. $integral_a^b k f(x) dx = k integral_a^b f(x) dx$（$k$ 为常数）
3. $integral_a^b [f(x) plus.minus g(x)] dx = integral_a^b f(x) dx plus.minus integral_a^b g(x) dx$
4. $integral_a^b f(x) dx = integral_a^c f(x) dx + integral_c^b f(x) dx$（$a < c < b$）

==== 曲边梯形的概念及面积求法

- *曲边梯形*：由直线 $x = a$、$x = b$（$a != b$）、$y = 0$ 和曲线 $y = f(x)$ 所围成的平面图形

- *面积求法*：
  1. 分割：将区间 $[a, b]$ 分成许多小区间
  
  2. 近似代替：在每个小区间上，用矩形面积近似代替小曲边梯形面积（以直代曲）
  3. 求和：将所有矩形面积相加，得到曲边梯形面积的近似值
  4. 取极限：当小区间长度趋于 0 时，近似值趋于定积分值，即面积 $S = integral_a^b f(x) dx$

==== 微积分基本定理
如果函数 $f(x)$ 是连续函数，且 $F(x)$ 是 $f(x)$ 的一个原函数（即 $F'(x) = f(x)$），则有：

$ integral_a^b f(x) dx = F(b) - F(a) $

记作 $F(x) |_a^b$，称为牛顿-莱布尼茨公式 . 

==== 定积分的应用

- *平面图形面积*：

  - 若 $f(x) >= 0$ 于 $[a, b]$，则面积 $S = integral_a^b f(x) dx$
  
  - 若 $f(x) <= 0$ 于 $[a, b]$，则面积 $S = -integral_a^b f(x) dx$
  - 若两曲线 $y = f(x)$ 和 $y = g(x)$ 满足 $f(x) >= g(x)$ 于 $[a, b]$，则所围面积 $S = integral_a^b [f(x) - g(x)] dx$
  
- *旋转体体积*：曲线 $y = f(x)$ 与直线 $x = a$、$x = b$ 及 $x$ 轴所围区域绕 $x$ 轴旋转一周的体积为：
$ V = pi integral_a^b [f(x)]^2 dx $

==== 积分方法

- *换元积分法*：设 $u = g(x)$ 可导，且 $f(u)$ 连续，则：
$ integral f(g(x)) g'(x) dx = integral f(u) du $
定积分中需改变积分限：$integral_a^b f(g(x)) g'(x) dx = integral_(g(a))^(g(b)) f(u) du$

- *分部积分法*：基于乘积法则，公式为：
$ integral u dv = u v - integral v du $
或等价地：
$ integral u v' dx = u v - integral u' v dx $
适用于乘积函数的积分，如多项式与指数函数、三角函数的乘积

=== 常用积分表
以下积分中，$C$ 为积分常数 . 

#align(center, table(
  columns: (auto, auto),
  inset: 10pt,
  align: center + horizon,
  stroke: none,
  table.hline(y: 0, stroke: 1.5pt),
  table.header([*函数*], [*积分*]),
  table.hline(y: 1, stroke: 0.5pt),
  [$integral x^n dx$], [$x^(n+1) / (n+1) + C$（$n != -1$）],
  [$integral 1/x dx$], [$ln |x| + C$],
  [$integral e^x dx$], [$e^x + C$],
  [$integral a^x dx$], [$a^x / (ln a) + C$（$a > 0, a != 1$）],
  [$integral sin x dx$], [$-cos x + C$],
  [$integral cos x dx$], [$sin x + C$],
  [$integral tan x dx$], [$-ln |cos x| + C$],
  [$integral cot x dx$], [$ln |sin x| + C$],
  [$integral sec^2 x dx$], [$tan x + C$],
  [$integral csc^2 x dx$], [$-cot x + C$],
  [$integral 1 / sqrt(1-x^2) dx$], [$arcsin x + C$],
  [$integral 1 / (1+x^2) dx$], [$arctan x + C$],
  [$integral ln x dx$], [$x ln x - x + C$],
  [$integral 1 / (x^2 + a^2) dx$], [$1 / a arctan x / a + C$（$a > 0$）],
  [$integral 1 / sqrt(x^2 + a^2) dx$], [$ln |x + sqrt(x^2 + a^2)| + C$],
  table.hline(stroke: 1.5pt),
))

== 初等数学常用公式

=== 三角函数

==== 角的度量

- *弧度定义*：弧长等于半径长的圆弧所对的圆心角为 1 弧度 . 

- *弧长公式*：若圆心角弧长为 $L$，半径为 $r$，则其弧度数绝对值为：
$ |alpha| = L / r $
- *角度转换*：$360^degree = 2pi$ rad . 

==== 任意角三角函数定义
在直角坐标系中，设角 $alpha$ 终边上任意一点（非原点）为 $P(x, y)$，其到原点的距离为 $r = sqrt(x^2+y^2)$，则：
$ sin alpha = y / r, quad cos alpha = x / r, quad tan alpha = y / x $
$ cot alpha = x / y, quad sec alpha = r / x, quad csc alpha = r / y $

==== 同角三角函数关系

- *商数关系*：
$ tan alpha = (sin alpha) / (cos alpha), quad cot alpha = (cos alpha) / (sin alpha) $
- *平方关系*：
$ sin^2 alpha + cos^2 alpha = 1, quad tan^2 alpha + 1 = sec^2 alpha, quad cot^2 alpha + 1 = csc^2 alpha $

==== 诱导公式

概括为“奇变偶不变，符号看象限” . 

- *与 $pi$ 相关*：
$ sin(alpha plus.minus pi) = -sin alpha, quad cos(pi plus.minus alpha) = -cos alpha, quad tan(pi plus.minus alpha) = tan alpha $

- *与余角相关*：
$ sin(pi/2 - alpha) = cos alpha, quad cos(pi/2 - alpha) = sin alpha, quad tan(pi/2 - alpha) = cot alpha $

==== 和差角与倍角公式

- *两角和差*：

$ cos(alpha plus.minus beta) = cos alpha cos beta minus.plus sin alpha sin beta $
$ sin(alpha plus.minus beta) = sin alpha cos beta plus.minus cos alpha sin beta $
$ tan(alpha plus.minus beta) = (tan alpha plus.minus tan beta) / (1 minus.plus tan alpha tan beta) $

- *倍角公式*：

$ sin 2alpha = 2 sin alpha cos alpha $
$ cos 2alpha = cos^2 alpha - sin^2 alpha = 2 cos^2 alpha - 1 = 1 - 2 sin^2 alpha $
$ tan 2alpha = (2 tan alpha) / (1 - tan^2 alpha) $
- *降幂公式*：
$ cos^2 alpha = (1 + cos 2alpha) / 2, quad sin^2 alpha = (1 - cos 2alpha) / 2 $

==== 辅助角公式

用于将同频率的 $sin$ 与 $cos$ 叠加：若 $a, b$ 为实数且 $a^2+b^2 != 0$，则：
$ a sin alpha + b cos alpha = sqrt(a^2 + b^2) sin(alpha + beta) $
其中角 $beta$ 的终边经过点 $(a, b)$，即 $sin beta = b / sqrt(a^2+b^2), cos beta = a / sqrt(a^2+b^2)$ . 

==== 解三角形与反三角函数

- *正弦定理*：
$ a / (sin A) = b / (sin B) = c / (sin C) = 2R $
- *余弦定理*：
$ a^2 = b^2 + c^2 - 2 b c cos A $
- *反函数限制*：$arcsin x$ 对应区间 $[-pi/2, pi/2]$，$arccos x$ 对应区间 $[0, pi]$ . 

- *重要不等式*：当 $x in (0, pi/2)$ 时：
$ sin x < x < tan x $

=== 平面解析几何与向量

==== 直线方程
1. 一般式：$A x + B y + C = 0$

2. 点斜式：$y - y_0 = k(x - x_0)$
3. 斜截式：$y = k x + b$
4. 截距式：$x / a + y / b = 1$
5. 参数式：
$ cases(x = x_0 + t cos theta, y = y_0 + t sin theta) $
*意义：$t$ 表示点 $P(x, y)$ 到定点 $P_0(x_0, y_0)$ 的有向线段数量 . *

==== 线线夹角与距离

- *到角与夹角*：设直线斜率为 $k_1, k_2$，到角为 $theta$（逆时针旋转角），夹角为 $alpha$（不大于 $90^degree$）：
$ tan theta = (k_2 - k_1) / (1 + k_1 k_2), quad tan alpha = |(k_2 - k_1) / (1 + k_1 k_2)| $
- *点到直线距离*：
$ d = (|A x_0 + B y_0 + C|) / sqrt(A^2 + B^2) $
- *两平行线间距离*：
$ d = (|C_1 - C_2|) / sqrt(A^2 + B^2) $

==== 圆与球

- *圆的标准方程*：$(x-a)^2 + (y-b)^2 = r^2$
- *球体公式*：
$ S_球 = 4 pi R^2, quad V_球 = 4 / 3 pi R^3 $

==== 平面向量

- *基本定理*：同一平面内任意向量 $vec(a)$ 均可由两个不共线向量 $vec(e)_1, vec(e)_2$ 唯一表示：$vec(a) = lambda_1 vec(e)_1 + lambda_2 vec(e)_2$ . 

- *坐标运算*：若 $vec(a)=(x_1, y_1), vec(b)=(x_2, y_2)$，则：
$ |vec(a)| = sqrt(x_1^2 + y_1^2) $
- *数量积（内积）*：
$ vec(a) dot vec(b) = |vec(a)||vec(b)| cos theta = x_1 x_2 + y_1 y_2 $
*几何意义：$vec(a) dot vec(b)$ 等于 $vec(a)$ 的模与 $vec(b)$ 在 $vec(a)$ 方向上投影的乘积 . *

- *矢量积（外积）*：
对于平面向量 $vec(a)=(x_1, y_1), vec(b)=(x_2, y_2)$，其矢量积的大小定义为以 $vec(a), vec(b)$ 为邻边的平行四边形的面积（带符号）：
其大小满足 $|vec(a) times vec(b)| = |vec(a)||vec(b)| sin theta$ . 

$ vec(a) times vec(b) = 
  mat(
    delim: "|",
    (bold(hat(i))), (bold(hat(j))), (bold(hat(k)));
    a_x, a_y, a_z;
    b_x, b_y, b_z
  ) $

=== 数列

==== 等差数列 ${a_n}$

- *定义*：$a_(n+1) - a_n = d$（常数） . 

- *通项与求和*：
$ a_n = a_1 + (n-1)d $
$ S_n = (n(a_1 + a_n)) / 2 = n a_1 + (n(n-1)) / 2 d $

==== 等比数列 ${a_n}$

- *定义*：$a_n / a_(n-1) = q$（非零常数） . 

- *中项*：若 $a, G, b$ 成等比，则 $G = plus.minus sqrt(a b)$ . 
- *前 $n$ 项和*：
$ S_n = cases(n a_1\, & q=1, (a_1(1-q^n)) / (1-q) = (a_1 - a_n q) / (1-q)\, & q != 1) $

==== 常用求和公式
$ 1+2+3+dots+n = (n(n+1)) / 2 $
$ 1^2+2^2+3^2+dots+n^2 = (n(n+1)(2n+1)) / 6 $

=== 不等式

- *基本不等式（均值不等式）*：
$ (a+b) / 2 >= sqrt(a b) quad (a, b > 0) $
*意义：两个正数的算术平均数不小于它们的几何平均数，当且仅当 $a=b$ 时等号成立 . *
- *三维情形*：
$ (a+b+c) / 3 >= root(3, a b c) quad (a, b, c in RR_+) $
- *链式不等式*：
$ 2 / (1/a+1/b) <= sqrt(a b) <= (a+b) / 2 <= sqrt((a^2+b^2) / 2) $

=== 圆锥曲线

==== 椭圆与双曲线

- *椭圆（焦点在 $x$ 轴）*：
$ x^2 / a^2 + y^2 / b^2 = 1 quad (a>b>0) => cases(x = a cos theta, y = b sin theta) $
- *双曲线（焦点在 $x$ 轴）*：
$ x^2 / a^2 - y^2 / b^2 = 1 => cases(x = a sec phi, y = b tan phi) $

==== 统一定义
到定点（焦点）的距离与到定直线（准线）的距离之比为常数 $e$（离心率）：
- $0 < e < 1$：椭圆；

- $e = 1$：抛物线（标准方程 $y^2 = 2 p x$）；
- $e > 1$：双曲线 . 
- *统一极坐标方程*：
$ rho = (p) / (1 - e cos theta) $

=== 极坐标、概率与近似

==== 极坐标转换
设 $M$ 点直角坐标为 $(x, y)$，极坐标为 $(rho, theta)$：
$ cases(x = rho cos theta, y = rho sin theta) <==> cases(rho^2 = x^2 + y^2, tan theta = y / x) $

==== 组合与二项式定理

- *组合数*：从 $n$ 个元素取 $m$ 个的组合数：
$ C_n^m = (n!) / (m!(n-m)!) $

- *二项式定理*：
$ (a+b)^n = sum_(r=0)^n C_n^r a^(n-r) b^r $
*其中 $T_(r+1) = C_n^r a^(n-r) b^r$ 是第 $r+1$ 项 . *

==== 微小量近似（当 $x << 1$ 时）
$ 1 / (1+x) approx 1-x, quad sqrt(1+x) approx 1 + 1/2 x, quad (1+x)^n approx 1+n x $


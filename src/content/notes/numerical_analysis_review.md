---
title: "数值分析-复习笔记"
description: "来自王何宇老师NA课程，此为面向期末考试的复习笔记（仅针对2026.1的期末考试）"
publishedAt: 2026-03-30
course: "数值分析"
semester: "2025-2026 秋冬"
tags:
  - 课程笔记
  - 数学
  - 计算数学
---

## Chap 1
- ***Q-收敛***：一个序列p阶Q-收敛到L如果

  $$
  \lim_{n\to\infty} \frac{|x_{n+1}-L|}{|x_n-L|^p}=c>0
  $$
- ***收敛和收敛阶***：一个序列线性收敛到L如果

  $$
  \exists c \in (0,1),\exists d>0,\text{s.t.}\forall n\in\mathbb{N},|x_n-L|\le c^nd
  $$

  收敛阶是满足下面条件最大的$p$:

  $$
  \exists c>0,\exists N\in\mathbb{N}\text{s.t.}\forall n>N,|x_{n+1}-L|\le|x_n-L|^p
  $$
- ***牛顿法***

  $$
  x_{n+1}=x_n-\frac{f(x_n)}{f'(x_n)}
  $$

  ***证明其2阶Q-收敛***：泰勒展开

  $$
  f(\alpha) = f(x_n) + (\alpha - x_n)f'(x_n) + \frac{(\alpha - x_n)^2}{2}f''(\xi)
  $$

  由$f(\alpha)=0$,

  $$
  -\alpha = -x_n + \frac{f(x_n)}{f'(x_n)} + \frac{(\alpha - x_n)^2}{2} \frac{f''(\xi)}{f'(x_n)}
  $$

  由牛顿法公式

  $$
  x_{n+1} - \alpha = x_n - \frac{f(x_n)}{f'(x_n)} - \alpha = (x_n - \alpha)^2 \frac{f''(\xi)}{2f'(x_n)}
  $$

  只要证明$\{x_n\}$收敛于$\alpha$即可。由于 $f'$ 的连续性以及 $f'(\alpha) \neq 0$ 的假设，存在 $\delta_1 \in (0, \delta)$ 使得对于所有 $x \in \mathcal{B}_1$，满足 $f'(x) \neq 0$，其中 $\mathcal{B}_1 = [\alpha - \delta_1, \alpha + \delta_1]$。定义$M := \frac{\max_{x \in \mathcal{B}_1} |f''(x)|}{2 \min_{x \in \mathcal{B}_1} |f'(x)|}$，并选取足够接近 $\alpha$ 的初始值 $x_0$ 使得： (i) $|x_0 - \alpha| = \delta_0 < \delta_1$； (ii) $M\delta_0 < 1$。由$M|x_0 - \alpha| < 1$和数学归纳法知

  $$
  |x_n - \alpha| \leq \frac{1}{M} (M|x_0 - \alpha|)^{2^n}
  $$

  即$\{x_n\}$收敛。
- ***牛顿法在重根处退化为1阶收敛***：

  $$
  f(x)=(x-\alpha)^mh(x)\implies \lim_{x\to\alpha} g'(x)=\lim_{x\to\alpha}\frac{f(x)f''(x)}{[f'(x)]^2}=1-\frac{1}{m}
  $$

  而

  $$
  \lim_{n\to\infty}\frac{x_{n+1}-\alpha}{x_n-\alpha}=g'(\alpha)
  $$

  故一阶收敛。
	- ***改进方法***
		1. 令$F(x)=\frac{f(x)}{f'(x)}$，则$\alpha$是$F(x)$的单根，对其作牛顿迭代
		2. 已知重数$m$，修改迭代公式

     $$
     x_{n+1}=x_n-m\frac{f(x_n)}{f'(x_n)}
     $$
- ***割线法***

  $$
  x_{n+1}=x_n-f(x_n)\frac{x_n-x_{n-1}}{f(x_n)-f(x_{n-1})}
  $$
- ***不动点***

  $$
  \text{some } \alpha \text{ satisfying } g(\alpha)=\alpha
  $$

  不动点迭代

  $$
  x_{n+1}=g(x_n)
  $$
- ***压缩映射***：$f:[a,b]\to[a,b]$是压缩映射如果

  $$
  \exists\lambda\in[0,1)\text{ s.t. }\forall x,y \in[a,b],|f(x)-f(y)|\le \lambda|x-y|
  $$

  ***压缩映射的收敛性***：对于$[a,b]$上的连续压缩映射$g(x)$，它在$[a,b]$上有唯一的不动点$\alpha$，并且对任何的$x_0\in[a,b]$，不动点迭代收敛至$\alpha$且

  $$
  |x_n-\alpha|\le\frac{\lambda^n}{1-\lambda}|x_1-x_0|
  $$

  ***定理1：*** 若$g:[a,b]\to[a,b] \in \mathcal{C}^1$且$\lambda = \max_{x\in[a,b]}|g'(x)|<1$（即$g$是压缩映射），则$g$在$[a,b]$上有唯一的不动点$\alpha$，并且对任何的$x_0\in[a,b]$，不动点迭代收敛至$\alpha$且

  $$
  \lim_{n\to\infty}\frac{x_{n+1}-\alpha}{x_n-\alpha}=g'(\alpha)
  $$

  ***定理2：*** 考虑$g:[a,b]\to[a,b]$有一个不动点$g(\alpha)=\alpha\in[a,b]$，则不动点迭代$p$阶Q-收敛于$\alpha$如果

  $$
  \begin{cases}g\in\mathcal{C}^p[a,b] \\ \forall k = 1,2,\ldots,p-1,g^{(k)}(\alpha)=0 \\ g^{(p)}(\alpha)\neq0\end{cases}
  $$

  且$x_0$充分小。渐近因子

  $$
  \lim_{n\to\infty}\frac{|x_{n+1}-\alpha|}{|x_n-\alpha|^p} = \frac{g^{(p)}(\alpha)}{p!}
  $$
## Chap 2
- 适用于Lagrange插值、Newton插值、Hermite插值的Cauchy余项

  $$
  R_n(f;x)=\frac{f^{(n+1)}(\xi)}{(n+1)!}\prod_{i=0}^n(x-x_i)
  $$

  其中$n+1$代表有$n+1$个限制条件，这会得到n次的插值多项式。在Hermite插值中有重复的$x_i$。
- ***Lagrange插值：***

  $$
  p_n(x)=\sum_{k=0}^nf_k\ell_k(x),\text{ where }\ell_k=\prod_{i=0,i\neq k}^n\frac{(x-x_i)}{(x_k-x_i)}
  $$
- ***Newton插值***：

  $$
  p_n(x)=\sum_{k=0}^na_k\pi_k(x),\text{ where }\pi_n(x)=\begin{cases}1,\quad\quad\quad\quad\quad\quad\ n=0\\ \prod_{i=0}^{n-1}(x-x_i),\quad n>0\end{cases}
  $$

  $a_k$是差商表中的对角元。
- ***Hermite插值：*** 允许出现重复节点的Newton插值。重复节点的$n$阶差商为$n-1$阶导数值。
- ***Chebyshev多项式***：

  $$
  T_n(x)=\cos(n\arccos x),\quad \forall n \in \mathbb{N}^+,T_{n+1}(x)=2xT_n(x)-T_{n-1}(x)
  $$

  零点

  $$
  x_k=\cos\frac{2k-1}{2n}\pi
  $$

  选择Chebyshev多项式的零点作为插值节点可以抑制Runge现象。

## Chap 3
### PP-form样条
- PP-form 样条（$\mathbb{S}_2^3$）有两种求解方法：对$i=2,3,\ldots,N-1$有（$m_i$是节点$x_i$处的一阶导数，$M_i$是节点$x_i$处的二阶导数）其中

  $$
  \lambda_i = \frac{x_{i+1}-x_i}{x_{i+1}-x_{i-1}},\quad \mu_i=\frac{x_i-x_{i-1}}{x_{i+1}-x_{i-1}}
  $$
	- $\lambda_im_{i-1}+2m_i+\mu_im_{i+1}=3\mu_if[x_i,x_{i+1}]+3\lambda_if[x_{i-1},x_i]$
		- ***证明***：记$p_i(x)=s|_{[x_i,x_{i+1}]},K_i=f[x_i,x_{i+1}]$则在每个区间上都可以看作一个Hermite插值。构建差商表如下：

    $$
    \begin{array}{c|cccc}x_i & f_i &&&\\x_i&f_i&m_i&&\\x_{i+1}&f_{i+1}&K_i&\frac{K_i-m_i}{x_{i+1}-x_i}&\\x_{i+1}&f_{i+1}&m_{i+1}&\frac{m_{i+1}-K_i}{x_i+1-x_i}&\frac{m_i+m_{i+1}-2K_i}{(x_{i+1}-x_i)^2}\end{array}
    $$

    由牛顿插值公式

    $$
    \begin{aligned}p_i(x)&=f_i+(x-x_i)m_i+(x-x_i)^2\frac{K_i-m_i}{x_{i+1}-x_i}\\&+(x-x_i)^2(x-x_{i+1})\frac{m_i+m_{i+1}-2K_i}{(x_{i+1}-x_i)^2}\\&=f_i+(x-x_i)m_i+(x-x_i)^2\frac{K_i-m_i}{x_{i+1}-x_i}\\&+(x-x_i)^2\left[(x-x_i)+(x_i-x_{i-1})\right]\frac{m_i+m_{i+1}-2K_i}{(x_{i+1}-x_i)^2}\\&=f_i+(x-x_i)m_i+(x-x_i)^2\frac{3K_i-2m_i-m_{i+1}}{x_{i+1}-x_i}\\&+(x-x_i)^3\frac{m_i+m_{i+1}-2K_i}{(x_{i+1}-x_i)^2}\end{aligned}
    $$

    记

    $$
    \begin{cases}p_i(x)=c_{i,0}+c_{i,1}(x-x_i)+c_{i,2}(x-x_i)^2+c_{i,3}(x-x_i)^3\\c_{i,0}=f_i\\c_{i,1}=m_i\\c_{i,2}=\frac{3K_i-2m_i-m_{i+1}}{x_{i+1}-x_i}\\c_{i,3}=\frac{m_i+m_{i+1}-2K_i}{(x_{i+1}-x_i)^2}\end{cases}
    $$

    因为$s\in\mathcal{C}^2$则$p_{i-1}''(x_i)=p_i''(x_i)$即

    $$
    2c_{i-1,2}+6c_{i-1,3}(x_i-x_{i-1})=2c_{i,2}
    $$

    代入得

    $$
    \frac{3K_{i-1}-2m_{i-1}-m_{i}}{x_{i}-x_{i-1}}+3\times\frac{m_{i-1}+m_{i}-2K_{i-1}}{x_{i}-x_{i-1}}=\frac{3K_i-2m_i-m_{i+1}}{x_{i+1}-x_i}
    $$

    化简即得$\lambda_im_{i-1}+2m_i+\mu_im_{i+1}=3\mu_if[x_i,x_{i+1}]+3\lambda_if[x_{i-1},x_i]$.
	- $\mu_iM_{i-1}+2M_i+\lambda_iM_{i+1}=6f[x_{i-1},x_i,x_{i+1}]$
		- ***证明***：对$s(x)$在节点$x_i$处作Taylor展开

    $$
    s(x)=f_i+s'(x_i)(x-x_i)+\frac{M_i}{2}(x-x_i)^2+\frac{s'''(x_i)}{6}(x-x_i)^3
    $$

    我们知道在$x=x_i$处样条的右三阶导数

    $$
    s'''(x_i)=\frac{M_{i+1}-M_i}{x_{i+1}-x_i}
    $$

    代入上式，令$x=x_{i+1}$得

    $$
    f_{i+1}=f_i+s'(x_i)(x_{i+1}-x_i)+\frac{M_i}{2}(x_{i+1}-x_i)^2+\frac{M_{i+1}-M_i}{6}(x_{i+1}-x_i)^2
    $$

    即

    $$
    s'(x_i)=f[x_i,x_{i+1}]-\frac{1}{6}(M_{i+1}+2M_i)(x_{i+1}-x_i)
    $$

    同理在$x=x_i$处样条的左三阶导数

    $$
    s'''(x_i)=\frac{M_{i}-M_{i-1}}{x_{i}-x_{i-1}}
    $$

    代入上式令$x=x_{i-1}$得

    $$
    s'(x_i)=f[x_{i-1},x_{i}]-\frac{1}{6}(M_{i-1}+2M_i)(x_{i-1}-x_i)
    $$

    两式相减即得$\mu_iM_{i-1}+2M_i+\lambda_iM_{i+1}=6f[x_{i-1},x_i,x_{i+1}]$
	这些关系提供了$N-2$个方程（针对节点$a=x_1<x_2<\ldots<x_N=b$)，剩余的两个方程由边界条件提供。
- ***边界条件及处理方法***
	- 完全三次样条：$m_1=f'(a),m_N=f'(b)$，直接代入一阶导数方程组求解，也可以导出二阶导数的方程

   $$
   \begin{cases}2M_1+M_2=6f[x_1,x_1,x_2]\\M_{N-1}+2M_N=6f[x_{N-1},x_N,x_N]\end{cases}
   $$
	- 指定端点二阶导数的三次样条：$M_1=f''(a),M_N=f''(b)$，直接代入二阶导数方程组求解
	- 自然三次样条：$M_1=M_N=0$，直接代入二阶导数方程组求解
	- 非节点三次样条：样条的三阶导数在$x_2,x_{N-1}$处存在。对于三次样条，三阶导数在每个区间是常数。故条件转化为方程：

   $$
   \begin{cases}\frac{M_2-M_1}{x_2-x_1}=\frac{M_3-M_2}{x_3-x_2}\\ \frac{M_N-M_{N-1}}{x_N-x_{N-1}}=\frac{M_{N-1}-M_{N-2}}{x_{N-1}-x_{N-2}}\end{cases}
   $$
	- 周期三次样条：样条在两端点的函数值、一阶导数值与二阶导数值完全相等。若采用二阶导数方程组求解，条件可以转化为方程（一阶导数类似）：

   $$
   \begin{cases}M_1=M_N\\ \frac{x_N-x_{N-1}}{x_2-x_1+x_N-x_{N-1}}M_{N-1}+2M_1+\frac{x_2-x_1}{x_2-x_1+x_N-x_{N-1}}M_2 = \frac{6}{x_2-x_1+x_N-x_{N-1}}\left(f[x_1,x_2]-f[x_{N-1},x_N]\right)\end{cases}
   $$
- 求解出节点处导数或二阶导数后要计算每段内的系数。设在$[x_i,x_{i+1}]$上表达式为

  $$
  s_i(x)=a_i+b_i(x-x_i)+c_i(x-x_i)^2+d_i(x-x_i)^3
  $$
	- 若求出$M_i$
		- $a_i=f(x_i)$
		- $c_i=\frac{M_i}{2}$ since $f''(x_i)=2c_i=M_i$
		- $d_i=\frac{M_{i+1}-M_i}{6(x_{i+1}-x_i)}$ since $f'''(x_i)=6d_i=\frac{M_{i+1}-M_i}{x_{i+1}-x_i}$
		- $b_i = \frac{f(x_{i+1})-a_i}{x_{i+1}-x_i}-c_i(x_{i+1}-x_i)-d_i(x_{i+1}-x_i)$
	- 若求出$m_i$
		- $a_i=f(x_i)$
		- $b_i=m_i$ since $f'(x_i)=b_i=m_i$
		- 对于$c_i$和$d_i$，使用右端点处$s_i(x_{i+1})=f(x_i),s_i'(x_{i+1})=m_{i+1}$列出方程组求解。
### B样条
- B样条由以下式子递归定义

  $$
  B_i^{n+1}(x)=\frac{x-t_{i-1}}{t_{i+n}-t_{i-1}}B_i^n(x)+\frac{t_{i+n+1}-x}{t_{i+n+1}-t_i}B_{i+1}^n(x)
  $$

  递归的基是0阶B样条

  $$
  B_i^0(x)=\begin{cases}1,\quad x\in(t_{i-1},t_i]\\ 0,\quad \text{otherwise}\end{cases}
  $$
- ***B样条的局部支撑***：$B_i^n$的支撑区间是$[t_{i-1},t_{i+n}]$，有$\forall x\in(t_{i-1},t_{i+n}),B_i^n(x)>0.$(阶数每增加1，支撑区间就向右扩展一个)
- ***B样条的光滑性***：$B_i^n\in \mathcal{C}^{n-1}$.
- ***截断幂函数***：

  $$
  x_+^n=\begin{cases}x^n,\quad x\ge0\\0,\quad x<0\end{cases}
  $$
- ***B样条与截断幂函数***：$B_i^n(x)=(t_{i+n}-t_{i-1})\cdot[t_{i-1},\ldots,t_{i+n}](t-x)_+^n$.
	- ***证明***：归纳证明。$n=0$时

   $$
   \begin{aligned}R.H.S.&=(t_i-t_{i-1})\cdot\frac{(t_i-x)_+^0-(t_{i-1}-x)_+^0}{t_i-t_{i-1}}\\&=(t_i-x)_+^0-(t_{i-1}-x)_+^0\\&=\begin{cases}1,\quad x\in(t_{i-1},t_i]\\0,\quad \text{otherwise}\end{cases}\end{aligned}
   $$

   这正是$B_i^0$的定义。下面假设对于$n$成立。由截断幂函数的定义$(t-x)_+^{n+1}=(t-x)\cdot(t-x)_+^n$.使用差商的Leibniz公式

   $$
   \begin{aligned}\left[t_{i-1},\ldots,t_{i+n}\right](t-x)_+^{n+1}&=\left[t_{i-1},\ldots,t_{i+n}\right](t-x)\cdot(t-x)_+^{n}\\&=\sum_{k=i-1}^{i+n}[t_{i-1},\ldots,t_k](t-x)\cdot[t_k,\ldots t_{i+n}](t-x)_+^{n}\\&=(t_{i-1}-x)\cdot\left[t_{i-1},\ldots,t_{i+n}\right](t-x)_+^{n}+\left[t_{i},\ldots,t_{i+n}\right](t-x)_+^{n}\end{aligned}
   $$

   使用$B_i^{n+1}(x)$的递归定义

   $$
   B_i^{n+1}(x)=\frac{x-t_{i-1}}{t_{i+n}-t_{i-1}}B_i^n+\frac{t_{i+n+1}-x}{t_{i+n+1}-t_{i}}B_{i+1}^n
   $$

   由归纳假设

   $$
   \begin{aligned}\frac{x-t_{i-1}}{t_{i+n}-t_{i-1}}B_i^n&=\frac{x-t_{i-1}}{t_{i+n}-t_{i-1}}(t_{i+n}-t_{i-1})\cdot[t_{i-1},\ldots,t_{i+n}](t-x)_+^n\\&=(x-t_{i-1})\cdot[t_{i-1},\ldots,t_{i+n}](t-x)_+^n\\&=\left[t_{i},\ldots,t_{i+n}\right](t-x)_+^{n}-\left[t_{i-1},\ldots,t_{i+n}\right](t-x)_+^{n+1}\\\frac{t_{i+n+1}-x}{t_{i+n+1}-t_{i}}B_{i+1}^n&=\frac{t_{i+n+1}-x}{t_{i+n+1}-t_{i}}(t_{i+n+1}-t_{i})\cdot[t_{i},\ldots,t_{i+n+1}](t-x)_+^n\\&=(t_{i+n+1}-x)\cdot[t_{i},\ldots,t_{i+n+1}](t-x)_+^n\\&=(t_{i+n+1}-t_i)\cdot[t_{i},\ldots,t_{i+n+1}](t-x)_+^n+(t_{i}-x)\cdot[t_{i},\ldots,t_{i+n+1}](t-x)_+^n\\&=[t_{i+1},\ldots,t_{i+n+1}](t-x)_+^n-[t_{i},\ldots,t_{i+n}](t-x)_+^n\\&+\left[t_{i},\ldots,t_{i+n+1}\right](t-x)_+^{n+1}-\left[t_{i+1},\ldots,t_{i+n+1}\right](t-x)_+^{n}\\&=\left[t_{i},\ldots,t_{i+n+1}\right](t-x)_+^{n+1}-[t_{i},\ldots,t_{i+n}](t-x)_+^n\end{aligned}
   $$

   所以

   $$
   \begin{aligned}B_i^{n+1}(x)&=\left[t_{i},\ldots,t_{i+n+1}\right](t-x)_+^{n+1}-\left[t_{i-1},\ldots,t_{i+n}\right](t-x)_+^{n+1}\\&=(t_{i+n+1}-t_{i-1})\left[t_{i-1},\ldots,t_{i+n+1}\right](t-x)_+^{n+1}\end{aligned}
   $$
- ***Marsden恒等式***：

  $$
  (t-x)^n=\sum_{i=-\infty}^{+\infty}(t-t_i)\cdots(t-t_{i+n-1})B_i^n(x)
  $$
- ***样条空间$\mathbb{S}_n^{n-1}(t_1,t_2,\ldots,t_N)$***：
	- $n+N-1$维：
		- 每个区间内是$n$阶多项式，有$n+1$个系数；
		- 有$N-1$个区间，故有$(n+1)(N-1)$个系数；
		- 在$N-2$个内部节点要求函数值、一阶导数值、...、$n-1$阶导数值相等，共$n(N-2)$个限制条件
		故$\dim(\mathbb{S}_n^{n-1})=(n+1)(N-1)-n(N-2)=n+N-1$.
	- $\mathbb{S}_n^{n-1}=\text{span}\{1,x,x^2,\ldots,x^n,(x-t_2)_+^n,(x-t_3)_+^n,\ldots,(x-t_{N-1})_+^n\}$：
		- ***证明***：假设

    $$
    \sum_{i=0}^na_ix^i+\sum_{j=2}^{N-1}a_{n+j}(x-t_j)^n_+=\mathbf{0}(x)
    $$

    当$x<t_2$时截断幂函数均为0，则需要$a_i=0,\forall i=0,1,\ldots,n$.当$x\in(t_2,t_3)$时上式变为$a_{n+2}(x-t_2)^n_+$，则$a_{n+2}=0$.这样下去可以得到所有系数均为0.由此$\{1,x,x^2,\ldots,x^n,(x-t_2)_+^n,(x-t_3)_+^n,\ldots,(x-t_{N-1})_+^n\}$是一个线性无关组，而元素个数等于维数，所以构成一组基。
	- 用前面提到的B样条与截断幂函数的关系以及Marsden恒等式，结合对称多项式的技巧，可以证明B样条$B^n_{2-n}(x),B^n_{3-n}(x),\ldots,B^n_N(x)$也构成样条空间的一组基。
- ***基数B样条***：$n$阶基数B样条，记作$B^n_{i,\mathbb{Z}}$，是节点选为$\mathbb{Z}$的B样条。
	- 基数B样条之间可以通过平移得到：$\forall x \in \mathbb{R},\quad B_{i,\mathbb{Z}}^n(x)=B_{i+1,\mathbb{Z}}^n(x+1)$ .
		- 证明：对n归纳即可。这一性质对于等距节点上的B样条基函数都成立。
	- 基数B样条是关于支撑区间中点对称的：$\forall n>0,\forall x \in \mathbb{R},\quad B_{i,\mathbb{Z}}^n(x)=B_{i,\mathbb{Z}}^n(2i+n-1-x)$.
		- 证明：同样对n归纳。这一性质对于等距节点上的B样条基函数都成立。
	- 存在唯一的 B 样条 $S(x) \in \mathbb{S}_3^2$ 在点 $1, 2, \dots, N$ 处插值 $f(x)$，并满足 $S'(1) = f'(1)$ 且 $S'(N) = f'(N)$。此外，该 B 样条表示为

   $$
   S(x) = \sum_{i=-1}^{N} a_i B_{i, \mathbb{Z}}^3(x)
   $$

   其中

   $$
   a_{-1} = a_1 - 2f'(1), \quad a_N = a_{N-2} + 2f'(N)
   $$

   且 $\mathbf{a}^\top = [a_0, \dots, a_{N-1}]$ 是线性方程组 $M\mathbf{a} = \mathbf{b}$ 的解，其中

   $$
   \mathbf{b}^\top = [3f(1) + f'(1), 6f(2), \dots, 6f(N-1), 3f(N) - f'(N)],
   $$

   $$
   M = \begin{bmatrix} 2 & 1 & & & \\ 1 & 4 & 1 & & \\ & \ddots & \ddots & \ddots & \\ & & 1 & 4 & 1 \\ & & & 1 & 2 \end{bmatrix} .
   $$
	- 存在唯一的 B 样条 $S(x) \in \mathbb{S}_2^1$ 在每个 $i = 1, 2, \dots, N-1$ 的 $t_i = i + \frac{1}{2}$ 处插值 $f(x)$，并满足边界条件 $S(1) = f(1)$ 且 $S(N) = f(N)$。此外，该 B 样条表示为

   $$
   S(x) = \sum_{i=0}^{N} a_i B_{i, \mathbb{Z}}^2(x), \tag{3.75}
   $$

   其中

   $$
   a_0 = 2f(1) - a_1, \quad a_N = 2f(N) - a_{N-1}, \tag{3.76}
   $$

   且 $\mathbf{a}^\top = [a_1, \dots, a_{N-1}]$ 是线性方程组 $M\mathbf{a} = \mathbf{b}$ 的解，其中

   $$
   \mathbf{b}^\top = \left[ 8f\left(\frac{3}{2}\right) - 2f(1), 8f\left(\frac{5}{2}\right), \dots, 8f\left(N-\frac{3}{2}\right), 8f\left(N-\frac{1}{2}\right) - 2f(N) \right],
   $$

   $$
   M = \begin{bmatrix} 5 & 1 & & & \\ 1 & 6 & 1 & & \\ & \ddots & \ddots & \ddots & \\ & & 1 & 6 & 1 \\ & & & 1 & 5 \end{bmatrix} .
   $$
## Chap 4
- ***基数***：用于表示数值的唯一符号的数量
- ***浮点数***: $x = \pm m \times \beta^e$，其中
	- $\beta$是基数
	- 指数$e\in[L,U]$
	- 尾数

   $$
   m = \left( d_0 + \frac{d_1}{\beta} + \dots + \frac{d_{p-1}}{\beta^{p-1}} \right)
   $$

   其中整数 $d_i$ 满足对于所有 $i \in [0, p-1]$，均有 $d_i \in [0, \beta-1]$。
- ***浮点数系统***：浮点数系统$\mathcal{F}$是有理数$\mathbb{Q}$的真子集，由四元组$(\beta,p,L,U)$决定
	- 基数$\beta$
	- 精度$p$
	- 指数的范围$[L,U]$
- ***规格化浮点数***：$1\le m<\beta$
- ***欠规格化浮点数***：$e=L,m\in(0,1)$
- ***机器精度***：一个规格化浮点数系统$\mathcal{F}$的机器精度是1.0和下一个浮点数之间的距离

  $$
  \epsilon_M:=\beta^{1-p}
  $$
- ***下溢极限(UFL)和上溢极限(OFL)：***

  $$
  \begin{aligned}\text{UFL}(\mathcal{F})&:=\min|\mathcal{F}-\{0\}|=\beta^L,\\ OFL(\mathcal{F})&:=\max|\mathcal{F}|=\beta^U(\beta-\beta^{1-p}).\end{aligned}
  $$

  分别是最小的正规格化浮点数和最大的规格化浮点数
- 最小的非规格化正浮点数：$\beta^{1-p+L}$
- ***注意***: 浮点数在数轴上的分布是不均匀的。比如，在$[1,\beta]$之间，两个相邻浮点数的距离是$\beta^{1-p}=\epsilon_M$，在$[\beta,\beta^2]$之间，两个相邻浮点数的的距离是$\beta\epsilon_M$.
- ***舍入规则***：
	- 对于$x\in\mathbb{R}$，映射$\text{fl}:\mathbb{R}\to\mathcal{F}\cup\{+\infty,-\infty,\text{NaN}\}$总是把$x$映射到离它最近的浮点数。有一些特殊情况
		- ***平局***：当$x$恰好是两个相邻浮点数的中点时，总是把$x$舍入到$d_{p-1}$为偶数的那个浮点数上。（我们默认$\beta$是偶数，因为当$\beta$为奇数时，可能出现这两个相邻浮点数一个$d_{p-1}=\beta-1$，另一个$d_{p-1}=0$的“双偶”情况，这时约定向0舍入）
		- ***上溢***：$\text{OFL}=\beta^U(\beta-\beta^{1-p})$，还存在一个理论上的下一个浮点数$\beta^{1+U}$，当$x$大于这两数的中点时，$\text{fl}(x)=+\infty$.
		- ***下溢***：
			- 规格化FPN：当$x<\frac12\beta^L$时，$\text{fl}(x)=0$.
			- 扩展FPN：当$x<\frac{1}{2}\beta^{1-p+L}$时，$\text{fl}(x)=0$.
- 单位舍入误差：$\epsilon_u:=\frac12\epsilon_M=\frac12\beta^{1-p}$
- 误差分析
	- 前向：$\text{fl}(x)=x(1+\delta)$
	- 后向：$\text{fl}(x)=\frac{x}{1+\delta}$
## Chap 5
- ***最佳逼近的定义***：对于函数赋范向量空间$Y$和子空间$X \subset Y$，称函数 $\hat{\varphi} \in X$ 为 $f \in Y$ 在 $X$ 中关于范数 $\|\cdot\|$ 的最佳逼近当且仅当：

  $$
  \forall \varphi \in X, \quad \|f - \hat{\varphi}\| \le \|f - \varphi\|
  $$
- ***最佳逼近的存在性***：设$X$是赋范向量空间$(Y,\|\cdot\|)$的有限维子空间，则

  $$
  \forall y\in Y,\exists\hat{\varphi}\in X,\|\hat{\varphi}-y\|\le\|\varphi-y\|
  $$

  ***证明***：对于给定的$y\in Y$定义闭球$B_y:=\{x\in X:\|x\|\le2\|y\|\}$则显然$0\in B_y$，故

  $$
  \text{dist}(y,B_y):=\inf_{x\in B_y}\|y-x\|\le\|y-0\|=\|y\|
  $$

  根据定义$\forall z\in X ,z\notin B_y$有$\|z\|>2\|y\|$，则

  $$
  \|z-y\|\ge\|z\|-\|y\|>\|y\|
  $$

  所以如果$y$的最佳逼近存在，那一定在$B_y$中。$B_y$作为$X$的子空间，是有限维、闭的并且是有界的。所以$B_y$是紧的。定义函数$d:B_y\to \mathbb{R}^+\cup\{0\},d(x) = \|x-y\|$，则$d$是$B_y$上的连续函数。故$d$一定在$B_y$上取得最小值。
- ***Gram-Schmidt正交化***：在预定义的范数$\|\cdot\|$和内积$\langle\cdot,\cdot\rangle$下，对线性无关组$(u_1,u_2,\cdots)$作如下操作，可以得到$\text{span}\{u_1,u_2,\ldots\}$的一组标准正交基：

  $$
  \begin{aligned}v_{n+1}&=u_{n+1}-\sum_{k=1}^n\langle u_{n+1},u^*_k\rangle u^*_k\\u^*_{n+1}&=\frac{v_{n+1}}{\|v_{n+1}\|}\end{aligned}
  $$

  ***注***：也可以选择不生成模长均为1的标准正交基，比如生成Legendre多项式，可以约束系数之和为1.但此时正交化过程发生变化：

  $$
  \begin{aligned}Q_{n+1}&=P_{n+1}-\sum_{k=1}^n\frac{\langle P_{n+1},P^*_k\rangle}{\langle P^*_k,P^*_k\rangle} P^*_k\\P^*_{n+1}&=\frac{Q_{n+1}}{\sum_{i=0}^{n+1}a_i}\end{aligned}
  $$
- ***Fourier展开***：设 $(u_1^*, u_2^*, \dots)$ 为一个有限或无限的标准正交序列。对于任意元素 $w$，其Fourier展开为：

  $$
  \sum_{n=1}^m \langle w, u_n^* \rangle u_n^*, \tag{5.18}
  $$
	- 若$w\in\text{span}\{u_1,u_2,\ldots u_n\}$，设$\{u^*_1,u^*_2,\ldots,u^*_n\}$是由$\{u_1,u_2,\ldots u_n\}$经Gram-Schmidt正交化得到的标准正交基，则

   $$
   w = \sum_{i=1}^n \langle w, u_i^* \rangle u_i^*
   $$
	- ***最小二乘逼近性质***:对于任意向量 $w$，傅里叶展开 $\sum \langle w, u_i^* \rangle u_i^*$ 满足：

   $$
   \|w - \sum_{i=1}^N \langle w, u_i^* \rangle u_i^*\| \le \|w - \sum_{i=1}^N a_i u_i^*\|
   $$

   ***证明***：考虑

   $$
   \begin{aligned}\|w - \sum_{i=1}^N a_i u_i^*\|^2&=\langle w-\sum_i a_iu^*_i, w-\sum_i a_iu^*_i\rangle\\&=\langle w,w\rangle-\langle w,\sum_i a_iu^*_i\rangle-\langle \sum_i a_iu^*_i,w\rangle+\langle\sum_i a_iu^*_i,\sum_i a_iu^*_i\rangle\\&=\|w\|^2-\sum_i\bar{a}_i\langle w,u_i^*\rangle-\sum_ia_i\langle u_i^*,w\rangle+\sum_i\sum_j\bar{a}_ia_j\\&=\|w\|^2-\sum_i\bar{a}_i\langle w,u_i^*\rangle-\sum_ia_i\langle u_i^*,w\rangle+\sum_i|a_i|^2\\&+\sum_i\langle u_i^*,w\rangle\langle w,u_i^*\rangle-\sum_i\langle u_i^*,w\rangle\langle w,u_i^*\rangle\\&=\|w\|^2-\sum_i|\langle w,u_i^*\rangle|^2+\sum_i|a_i-\langle w,u_i^*\rangle|^2\end{aligned}
   $$

   则当且仅当$\forall i,a_i = \langle w,u_i^*\rangle$时取得最小值。
	- ***最小二乘残量***：

   $$
   \|w - \hat{\varphi}\|^2 = \|w\|^2 - \sum_{k=1}^n |\langle w, u_k^* \rangle|^2
   $$
	给定内积空间中的子空间 $V$，向量 $w$ 在 $V$ 上的Fourier展开是 $V$ 中唯一使得 $L^2$ 误差范数最小化的元素。
 - ***正规方程组***：当要求在非标准正交基下的最佳逼近时，要使用正规方程组来求解。设$\hat{\varphi}=\sum_{i=1}^na_iu_i$是$w$在基$(u_1,u_2,\ldots,u_n)$下的最佳逼近，则系数$\mathbf{a}=[a_1,a_2,\ldots,a_n]^T$满足

   $$
   G(u_1,u_2,\ldots,u_n)^T\mathbf{a}=\mathbf{c}
   $$

   其中$\mathbf{c}=[\langle w,u_1\rangle,\langle w,u_2\rangle,\ldots,\langle w,u_n\rangle]^T$,$G(u_1,u_2,\ldots,u_n)$是Gram矩阵

   $$
   G=\begin{bmatrix}\langle u_1,u_1\rangle & \langle u_1,u_2\rangle & \cdots&\langle u_1,u_n\rangle\\\langle u_2,u_1\rangle&\langle u_2,u_2\rangle&\cdots&\langle u_2,u_n\rangle\\\vdots&\vdots&\ddots&\vdots\\\langle u_n,u_1\rangle&\langle u_n,u_2\rangle&\cdots&\langle u_n,u_n\rangle\end{bmatrix}
   $$
 - ***线性离散最小二乘***：可以理解为有特殊内积和范数定义的连续最小二乘。
	 - 内积：$\langle f,g\rangle=\sum_{i=1}^mf(x_i)g(x_i)$
	 - 范数：$\|f\|=\left[\sum_{i=1}^mf^2(x_i)\right]^{1/2}$ 
	 设给定的基为$\left[u_1(x),u_2(x),\ldots,u_n(x)\right],\quad(n<m)$，目标函数满足$y(x_i)=y_i$。要最小化$$\|y-\sum_{j=1}^n a_ju_j(x)\|^2=\sum_{i=1}^m\left(y_i-\sum_{j=1}^na_ju_j(x_i)\right)^2$$
  可以采用两种方法：
	 - ***正规方程组***：构建Gram矩阵$G(u_1,u_2,\ldots,u_n)$和$\mathbf{c}=[\langle y,u_1\rangle,\langle y,u_2\rangle,\ldots,\langle y,u_n\rangle]$则$\mathbf{a}=G^{-1}\mathbf{c}$
	 - ***QR分解***：记$\mathbf{b}=[y_1,y_2,\ldots,y_m]^T,\mathbf{a}=[a_1,a_2,\ldots,a_n]^T,\mathbf{A}=(u_j(x_i))_{m\times n}$，则可以写成超定方程组
        
        $$
        \begin{bmatrix}u_1(x_1)&u_2(x_1)&\cdots&u_n(x_1)\\u_1(x_2)&u_2(x_2)&\cdots&u_n(x_2)\\\vdots&\vdots&\ddots&\vdots\\u_1(x_m)&u_2(x_m)&\cdots&u_n(x_m)\end{bmatrix}\begin{bmatrix}a_1\\a_2\\\vdots\\a_n\end{bmatrix}=\begin{bmatrix}y_1\\y_2\\\vdots\\y_m\end{bmatrix}
        $$

    对$\mathbf{A}$进行QR分解：$\mathbf{A}=Q\begin{pmatrix}R\\\mathbf{0}\end{pmatrix}$ 其中$Q\in\mathbb{R}^{m\times m},R\in\mathbb{R}^{n\times n}$，$Q$为正交阵，$R$为上三角矩阵。则最小二乘解为$R\mathbf{a}=\mathbf{b}_1$的解。其中$\mathbf{b}_1$是$Q^T\mathbf{b}$的前$n$个元素组成的向量。
## Chap 6
- 加权求积公式$I_n(f)$是一个线性泛函

  $$
  I_n(f):=\sum_{k=1}^n w_kf(x_k)
  $$

  用来逼近积分

  $$
  I(f):=\int_a^bf(x)\rho(x)\mathrm{d}x
  $$
- $I_n(f)$在$\mathcal{C}[a,b]$收敛当且仅当

  $$
  \forall f\in\mathcal{C}[a,b],\lim_{n\to+\infty}I_n(f)=I(f)
  $$
- ***精度***：加权求积公式有$d_E$阶精度当且仅当

  $$
  \begin{cases}\forall f\in\mathbb{P}_{d_E},\quad E_n(f)=0\\\exists g\in\mathbb{P}_{d_E+1},\quad E_n(g)\neq0\end{cases}
  $$
- ***定理***： 设 $x_1, \dots, x_n$ 是区间 $[a, b]$ 内 $n$ 个互不相同的节点。求积公式 $I_n(f) = \sum_{k=1}^n w_k f(x_k)$ 具有至少 $n-1$ 阶代数精度的充分必要条件是：

  $$
  w_k = \int_a^b \rho(x) \ell_k(x) dx, \quad k=1, \dots, n
  $$

  其中 $\ell_k(x)$ 是关于这些节点的 Lagrange 插值基函数。即

  $$
  \ell_k(x)=\prod_{i=1,i\neq k}^n\frac{x-x_i}{x_k-x_i}
  $$

  此时的求积公式事实上就是对插值多项式的加权积分。
- ***Newton-Cotes公式***：在等距节点上插值导出的公式。
	- 梯形公式：插值点为左右两端点。
        - 精度：1阶
		- 误差：$\exists\zeta\in(a,b), \text{ s.t. }E^T(f)=-\frac{(b-a)^3}{12}f''(\zeta)$
			- ***证明***：插值误差$R=\frac{f''(\xi(x))}{2}(x-a)(x-b)$，积分

     $$
     \begin{aligned}E^T(f)&=\int_a^b\frac{f''(\xi(x))}{2}(x-a)(x-b)\mathrm{d}x\\&=\frac{f''(\zeta)}{2}\int_a^b(x-a)(x-b)\mathrm{d}x=-\frac{(b-a)^3}{2}f''(\zeta)\end{aligned}
     $$
	- 中点公式：插值点为区间中点。在区间内为常数。
		- 精度：1阶
	- Simpson公式：插值点为区间的两端点和区间中点。
        - 精度：3阶
		- 误差：$\exists\zeta\in(a,b), \text{ s.t. }E^T(f)=-\frac{(b-a)^5}{2880}f^{(4)}(\zeta)$
- ***复化求积公式***：把求积区间切分成多个，在子区间上应用Newton-Cotes公式
	- 复化梯形公式：在每个子区间上应用梯形公式
		- 误差：$\exists \xi\in(a,b)\quad \text{s.t. }E_n^T(f)=-\frac{b-a}{12}h^2f''(\xi)$ 
			- 证明：对梯形公式的误差求和，运用介值定理。
	- 复化Simpson公式：在每两个相邻子区间上应用Simpson公式
		- 误差：$\exists \xi\in(a,b)\quad \text{s.t. }E_n^S(f)=-\frac{b-a}{180}h^4f^{(4)}(\xi)$
	注意：复化公式并不能提高代数精度，但是能减小截断误差。
- ***代数精度的提高***：一个插值型公式，即代数精度 $d_E \geq n-1$ 的求积公式，当且仅当其节点多项式和权函数满足以下附加条件时，其代数精度可以提高到 $d_E \geq n+j-1$（其中 $j = 1, 2, \dots, n$）：

  $$
  \forall p \in \mathbb{P}_{j-1}, \quad \int_{a}^{b} v_n(x) p(x) \rho(x) \mathrm dx = 0.
  $$
	- ***证明***：若$d_E\ge n+j-1$，由于$\deg(v_n)=n,\deg(p)\le j-1$，则$\deg(v_np)\le n+j-1$，故求积公式对于$v_n(x)p(x)$是精确的。即

   $$
   \int_{a}^{b} v_n(x) p(x) \rho(x) \mathrm dx=\sum_{k=1}^nw_kv_n(x_k)p(x_k)=0
   $$

   若$v_n(x)$与$\mathbb{P}_{j-1}$正交，考虑$\forall p \in\mathbb{P}_{n+j-1}$ ,由多项式的带余除法有

   $$
   \exists q(x)\in\mathbb{P}_{j-1},\exists r(x)\in\mathbb{P}_{n-1},\quad p(x)=q(x)v_n(x)+r(x)
   $$

   则

   $$
   \int_a^bp(x)\rho(x)\mathrm dx=\int_a^bq(x)v_n(x)\rho(x)\mathrm dx+\int_a^br(x)\rho(x)\mathrm dx
   $$

   由于$v_n(x)$与$\mathbb{P}_{j-1}$正交，则前一项积分为0.有

   $$
   \int_a^bp(x)\rho(x)\mathrm dx=\int_a^br(x)\rho(x)\mathrm dx
   $$

   考虑求积公式有

   $$
   \sum_{k=1}^nw_kp(x_k)=\sum_{k=1}^nw_k\left[v_n(x_k)q(x_k)+r(x_k)\right]=\sum_{k=1}^nw_kr(x_k)
   $$

   而$r(x)$是次数不超过$n-1$的多项式，故自然成立

   $$
   \int_a^br(x)\rho(x)\mathrm dx=\sum_{k=1}^nw_kr(x_k)\implies \int_a^bp(x)\rho(x)\mathrm dx=\sum_{k=1}^nw_kp(x_k)
   $$
- ***Gauss积分公式***：由上述定理，只要取$v_n(x)$为权函数$\rho(x)$下$\mathbb{P}_{n-1}$的正交多项式，即取节点为正交多项式的零点，则可以获得$2n-1$阶精度。
	- Gauss积分公式有正权重。
		- ***证明***：Lagrange插值基函数$\ell_k(x)$在节点$x_k$处为1，在其它节点处为0.则

    $$
    w_k=\sum_{j=1}^nw_j\ell_k^2(x_j)=\int_a^b\rho(x)\ell_k^2(x)\mathrm dx>0
    $$

    第二个等号成立是因为$\ell_k^2(x)\in\mathbb{P}_{2n-2}$
	- Gauss积分公式的截断误差

   $$
   \exists\xi\in(a,b)\text{ s.t. }E_n^G(f)=\frac{f^{(2n)}(\xi)}{(2n)!}\int_a^b\rho(x)v_n^2(x)\mathrm dx
   $$
- 数值微分的***待定系数法***：用于推导近似 $u^{(k)}(\bar{x})$ 的有限差分公式的通用方法，是基于由 $n > k$ 个互异点 $x_1, x_2, \dots, x_n$ 组成的任意型值点集 。将 $u$ 在型值点集中的每个点 $x_i$ 处绕 $u(\bar{x})$ 进行泰勒展开

  $$
  u(x_i) = u(\bar{x}) + (x_i - \bar{x})u'(\bar{x}) + \dots + \frac{1}{k!}(x_i - \bar{x})^k u^{(k)}(\bar{x}) + \dots
  $$

  将$u(x_i)$乘以系数$c_i$后求和，令求和后小于$k$阶的导数的系数全为0.则- 数值微分的***待定系数法***：用于推导近似 $u^{(k)}(\bar{x})$ 的有限差分公式的通用方法，是基于由 $n > k$ 个互异点 $x_1, x_2, \dots, x_n$ 组成的任意型值点集 。将 $u$ 在型值点集中的每个点 $x_i$ 处绕 $u(\bar{x})$ 进行泰勒展开

  $$
  u(x_i) = u(\bar{x}) + (x_i - \bar{x})u'(\bar{x}) + \dots + \frac{1}{k!}(x_i - \bar{x})^k u^{(k)}(\bar{x}) + \dots
  $$

  将$u(x_i)$乘以系数$c_i$后求和，令求和后小于$k$阶的导数的系数全为0.则

  $$
  u^{(k)}(\bar{x}) = c_1 u(x_1) + c_2 u(x_2) + \dots + c_n u(x_n) + O(h^p)
  $$

  其中

  $$
  \forall i = 0, \dots, p-1, \quad \frac{1}{i!} \sum_{j=1}^{n} c_j (x_j - \bar{x})^i = \begin{cases} 1 & \text{if } i = k, \\ 0 & \text{otherwise.} \end{cases}
  $$

  有$p>k$
- ***数值微分的总误差***：考虑公式

  $$
  D^2 u(\bar{x}) = \frac{u(\bar{x} - h) - 2u(\bar{x}) + u(\bar{x} + h)}{h^2}
  $$

  具有二阶精度。此外，如果输入的函数值 $u(\bar{x} - h)$、$u(\bar{x})$ 和 $u(\bar{x} + h)$ 受到范围在 $\epsilon \in [-E, E]$ 内的随机误差扰动，则存在 $\xi \in (\bar{x} - h, \bar{x} + h)$ 使得：

  $$
  |u''(\bar{x}) - D^2 u(\bar{x})| \leq \frac{h^2}{12}|u^{(4)}(\xi)| + \frac{4E}{h^2}.
  $$
	- ***证明***：
		- 截断误差：考虑泰勒展开

    $$
    \begin{aligned}u(\bar{x}+h) &= u(\bar{x}) + h u'(\bar{x}) + \frac{h^2}{2} u''(\bar{x}) + \frac{h^3}{6} u'''(\bar{x}) + \frac{h^4}{24} u^{(4)}(\xi_1)\\u(\bar{x}-h) &= u(\bar{x}) - h u'(\bar{x}) + \frac{h^2}{2} u''(\bar{x}) - \frac{h^3}{6} u'''(\bar{x}) + \frac{h^4}{24} u^{(4)}(\xi_2)\end{aligned}
    $$

    相加利用介值定理得

    $$
    \exists \zeta \in(\bar{x}-h,\bar{x}+h),\quad u(\bar{x}+h) + u(\bar{x}-h) = 2 u(\bar{x}) + h^2 u''(\bar{x}) + \frac{h^4}{12} u^{(4)}(\zeta)
    $$

    故

    $$
    \frac{u(\bar{x}-h) - 2u(\bar{x}) + u(\bar{x}+h)}{h^2} = u''(\bar{x}) + \frac{h^2}{12} u^{(4)}(\xi)
    $$

    考虑舍入误差 $\tilde{u}(x_i) = u(x_i) + \epsilon_i$，其中 $|\epsilon_i| \le E$

    $$
    |\tilde{D^2}u - D^2 u| = \left| \frac{\epsilon_{-1} - 2\epsilon_0 + \epsilon_1}{h^2} \right| \le \frac{|\epsilon_{-1}| + 2|\epsilon_0| + |\epsilon_1|}{h^2} \le \frac{4E}{h^2}
    $$

    则总误差

    $$
    |u''(\bar{x}) - D^2 u(\bar{x})| \leq \frac{h^2}{12}|u^{(4)}(\xi)| + \frac{4E}{h^2}.
    $$
- ***Richardson外推***：假设我们要近似未知常数$M$，有公式$N_1(h)$满足

  $$
  M - N_1(h) = K_1 h + K_2 h^2 + K_3 h^3 + \dots ,
  $$

  其中$K_1, K_2, K_3, \dots$ 是一组（未知的）常数。截断误差为$O(h)$。我们可以组合 $N_1(h)$ 公式来产生一个关于 $M$ 的 $O(h^2)$ 近似公式 $N_2(h)$，这个过程叫做外推。考虑

  $$
  M = N_1\left(\frac{h}{2}\right) + K_1 \frac{h}{2} + K_2 \frac{h^2}{4} + K_3 \frac{h^3}{8} + \dots
  $$

  用这个式子的两倍减去第一个式子，可以得到

  $$
  M = N_1\left(\frac{h}{2}\right) + \left[N_1\left(\frac{h}{2}\right) - N_1(h)\right] + K_2 \left(\frac{h^2}{2} - h^2\right) + K_3 \left(\frac{h^3}{4} - h^3\right) + \dots
  $$

  定义

  $$
  N_2(h) = N_1\left(\frac{h}{2}\right) + \left[N_1\left(\frac{h}{2}\right) - N_1(h)\right] .
  $$

  则其是 $M$ 的一个 $O(h^2)$ 近似公式。
## ODE初值问题
- Euler法

  $$
  y_{i+1} = y_i + h\cdot f(x_i,y_i)
  $$

  局部截断误差：

  $$
  \begin{aligned}\tau_i &= y(x_{i+1})- y_{i+1}\\&=y(x_i+h)-y(x_i)-hy'(x_i)\\&=h^2\frac{y''(\xi)}{2}=O(h^2)\end{aligned}
  $$
- 高阶Taylor方法：

  $$
  \begin{aligned}y_{i+1}&=y(t_i)+hy'(t_i)+\frac{h^2}{2}y''(t_i)+\cdots\\&=y(t_i)+hf(t_i,y_i)+\frac{h^2}{2}[f_t(t_i,y_i)+f_y(t_i,y_i)\cdot f(t_i,y_i)]\end{aligned}
  $$

  有更高阶的截断误差，但求高阶导太麻烦。
- Runge-Kutta方法：设

  $$
  y_{i+1}=y_i+af(t_i+b,y_i+c)
  $$

  泰勒展开得

  $$
  y_{i+1}=y_i+af(t_i,y_i)+abf_t(t_i,y_i)+acf_y(t_i,y_i)+\frac{ab^2}{2}f_{tt}(t_i,y_i)+abcf_{ty}(t_i,y_i)+\frac{ac^2}{2}f_{yy}(t_i,y_i)
  $$

  与二阶Taylor法对比系数得

  $$
  a=h,b=\frac{h}{2},c=\frac{h}{2}f(t_i,y_i)
  $$

  等效于高阶Taylor法。
- 线性k步法的一般形式:
$$
\begin{aligned}
y_{i+1} &= \sum_{j=1}^k\alpha_jy_{i+1-j}+h\sum_{j=0}^k\beta_jf(x_{i+1-j},y_{i+1-j})\\
&=\alpha_1 y_i + \alpha_2 y_{i-1} + \ldots + \alpha_k y_{i+1-k} \\
&+h[\beta_0f(t_{i+1},y_{i+1}) + \beta_1f(t_i,y_i) + \ldots + \beta f(t_{i+1-k}, y_{i+1-k})]
\end{aligned}
$$
- 稳定性
	- 零稳定：若对某个固定的$T >0$，当$h \to 0$时，某方法对$y(T)$的数值解保持有界，则称该数值方法是零稳定的
	- 绝对稳定：若对某个固定的$h>0$，当$T \to \infty$时，某方法对$y(T)$的数值解保持有界，则称该数值方法是绝对稳定的
- 判定
	- 判定零稳定性：去掉全部的$h\beta_j$项，保留全部的$\alpha_j$项，代入$y_i = Az^i$得$$z^{k} - \alpha_iz^{k-1} - \alpha_2z^{k-2} - \ldots -\alpha_k = 0$$，其$k$个根记作$z_j \in \mathbb{C}$
		- 若这些根互异，则通解为$$y_i = A_1z_1^i+A_2z_2^i+\ldots+A_kz_k^i$$
		- 对重根$z_1=z_2$，则$A_2z_2^i$应替换为$A_2^iz_2^i$
		- 根条件：一个线性多步法是稳定的当且仅当其特征多项式所有根$|z_j| \leq 1$，并且所有满足$|z_j|=1$的根的重数为1.
- **Thm**(Dahl Quist)若一个线性多步法具有局部截断误差$O(h^{p+1})$且是零稳定的，则其全局误差为$O(h^p)$.若$p > 0$，当$h \to 0$时，该方法收敛到精确解，称其为具有精度阶$p$的收敛方法。
- **Def** 若一个线性多步法的局部截断误差比$h$更快地趋于0，则称该方法是相容的，即$p>0$。一个方法是收敛的当且仅当它既相容又稳定。
- **Thm**(第一代Dahl Quist稳定性障碍)：一个稳定的线性$k$步法，其精度阶数最多为：
	- $k$，若为显性式
	- $k+1$，若为隐性式，且$k$为奇数
	- $k+2$，若为隐性式，且$k$为奇数


- 零稳定性：事实上关心齐次方程

  $$
  y'=0,\quad 0<t<T,y(0)=1
  $$
- 时间稳定性：保留一项$h$

  $$
  y'=\lambda y(t),\quad t>0, y(0)=c
  $$

  其中$\lambda \in \mathbb{C}$，且$\text{Re}\{\lambda\} < 0$ .
- **Def** 若对固定的$h>0$和$\lambda \in \mathbb{C}$，且$\text{Re}\{\lambda\} < 0$ ，数值方法当$t \to \infty$时，对标准问题的数值解也趋于0，则称该方法是时间稳定的。
	- 对一般的线性$k$步法

   $$
   y_{i+1}=\alpha_1y_i + \ldots +\alpha_ky_{i-k+1}+h\lambda\beta_0y_{i+1}+h\lambda\beta_1y_i+\ldots+h\lambda\beta_ky_{i+1-k}
   $$

   代入$y_i=Az^i$得

   $$
   (1-h\lambda\beta_0)z^k-(\alpha_1+h\lambda\beta_1)z^{k-1}-\ldots-(\alpha_{k-1}+h\lambda\beta_{k-1})z-(\alpha_k+h\lambda\beta_k)=0
   $$

   （稳定多项式）
	- **Def** 在$\bar{h} = h\lambda$的复平面上，使稳定多项式的全部根$|z|<1$的$\bar{h}$的区域称为时间稳定区域
	- 变换稳定多项式，用$z$表示$\bar{h}$，令$z = e^{i\theta}$，让$\theta$绕一圈，$\bar{h}$会围成一个封闭曲线，可以分别带入范围内外的$\bar{h}$求出稳定多项式的根看模长。
- 刚性方程
	- 考虑初值问题

   $$
   \frac{dy}{dt}=-100(y-\cos t)-\sin t, \quad t>0,y(0)=1
   $$

   作变量替换：$x'(t) = y(t) - \cos t$得

   $$
   x'(t)=\lambda x(t), \quad \lambda=-100
   $$

   用AB2:

   $$
   y_{i+1}=y_i+\frac{h}{2}(3f_i-f_{i-1})
   $$

   得

   $$
   y_{i+1}=(1-150h)y_i+50hy_{i-1}
   $$

   稳定多项式

   $$
   z^2-(1-150h)z-50h=0 \implies h = \frac{z^2-z}{50-150z}
   $$

   代入$z = \pm1$ 得

   $$
   h=\begin{cases}0,z=1 \\ 0.01,z=-1\end{cases}
   $$

   即当$0<h<0.01$时算法是时间稳定的
## 细节
- 误差项中$\xi$的范围能否包含边界：
	- 数值积分包含
	- 插值、数值微分、牛顿迭代不包含

## Chap 7 边值问题的有限差分方法
- 经过有限差分法，我们有数值解$(x_i,U_i),i=1,2,\ldots,m$。现任取$x \in \Omega$

  $$
  u(x)\approx\begin{cases}U_i \quad x_i\text{ is the nearest knot}\\x\in[x_i,x_{i+1}] \quad \text{use }(x_i,U_i),(x_{i+1},U_{i+1})\text{ to generate an interpolating polynomial}\end{cases}
  $$
- 有限差分格式的局部截断误差是指用差商代替对应微分算子所产生的误差。如使用中心差分格式代替二阶导数时，局部截断误差就是$O(h^2)$

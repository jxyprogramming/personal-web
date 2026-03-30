---
title: "面向对象程序设计-课堂笔记"
description: "来自翁恺老师oop课程"
publishedAt: 2026-03-30
course: "面向对象程序设计"
semester: "2024-2025 春夏"
tags:
  - 课程笔记
  - 编程
---

## Week 1
### Buzzwords
+ *arbitrary* 随机的
+ *cohesion* 内聚
+ *collection classes* 容器
+ *coupling* 耦合
+ *encapsulation* 封装
+ *exploit* 利用
+ *field* 字段（成员变量）
+ *inheritance* 继承
+ *interface* 接口
+ *override* 覆盖
+ *polymorphism* 多态
+ *responsibility-driven design* 责任驱动设计
+ *template* 模板

### Using Objects
#### string
##### 库
`#include <string>`
##### 声明
`string str;`
##### 初始化
+ `string name = "John";` 
+ `string name2("John");`
+ `string name3{"John"};`
##### 运算
+ `name += "Johnson";`
+ `str = str1 + str2;`
+ `str1 += str2;`
##### 访问
+ `str[0] //越界导致未定义行为`
+ `str.at(0) //越界抛出异常`
##### 构造函数
+ `string (const char *cp, int len); //从C风格字符数组初始化，len代表复制多少个字符`  
+ `string (const string& s2, int pos); //从pos位置开始从s2中拷贝`
+ `string (const string& s2, int pos, int len); //从pos位置开始从s2中拷贝len个字符`
##### 方法
+ `int length();`
+ `string& substr(size_t pos, size_t len);`
+ `string& insert(size_t pos, const string& s);`
+ `string& erase(size_t pos = 0, size_t len = npos) //len表示要删除的字符个数，npos即删除到结尾;`
+ `string& append(const string& str);`
+ `string& replace(size_t pos, size_t len, const string& str);`
+ `size_t find(const string& str, size_t pos = 0) const; //从pos开始查找`
##### 注意
  如果字符串中包含空格，则`cin`只会读取到第一个空格前的内容
  读取整行：`getline(cin, line_val);`

## Week2
### Container 容器
#### vector
##### 构造函数与初始化
```cpp
int main() { 
// 1. 默认构造函数：创建一个空的 vector 
std::vector<int> v1; 
// 2. 带参数的构造函数：
std::vector<int> v2(5); //创建包含 5 个元素的 vector，每个元素都初始化为 0 
std::vector<int> v3(5, 100); //创建包含 5 个元素的 vector，每个元素都初始化为 100 
// 3. 列表初始化 (cpp11 及以后)：最常用的方式 
std::vector<std::string> v4 = {"你好", "世界", "!"}; std::vector<int> v5{1, 2, 3, 4, 5}; 
// 4. 拷贝构造函数：用一个已有的 vector 创建新的 vector 
std::vector<int> v6(v5); 
// 5. 范围构造函数：用其他容器的迭代器范围来创建 
std::vector<int> v7(v5.begin(), v5.begin() + 3); // 包含 v5 的前 3 个元素 {1, 2, 3} 
}
```
##### 常用成员函数
+ 容量管理
	+ `v.size()`：返回容器中元素个数
	+ `v.empty()`：判断容器是否为空
	+ `v.capacity()`：返回当前已分配内存能够容纳的元素个数($\geq$ `v.size()` )
	+ `v.reserve(n)`：预分配至少能容纳n个元素的内存
+ 元素访问
	+ `v[i]`：无边界检查
	+ `v.at(i)`：越界抛异常`std::out_of_range`
	+ `v.front()`：第一个元素
	+ `v.back()`：最后一个元素
+ 修改器
	+ `v.push_back(value)`：在容器末尾添加元素
	+ `v.pop_back`：删除容器末尾的元素
	+ `v.insert(iterator, value)`：在迭代器指定位置**前**插入元素
	+ `v.erase(iterator)`：删除迭代器指定的元素
	+ `v.erase(start_iterator, end_iterator)`：删除范围内的元素（不包括end）
	+ `v.clear()`：清空
###### size和capacity
修改器永远改的是size的大小。当容器快要满时，capacity会自动扩容，而且不会自动变小。
##### 遍历
```cpp
int main() {
    std::vector<int> v = {10, 20, 30, 40, 50};

    // 方式一：使用索引的 for 循环 (vector 特有优势)
    std::cout << "使用索引遍历: ";
    for (size_t i = 0; i < v.size(); ++i) {
        std::cout << v[i] << " ";
    }
    std::cout << std::endl;

    // 方式二：使用迭代器 (通用方式)
    std::cout << "使用迭代器遍历: ";
    for (std::vector<int>::iterator it = v.begin(); it != v.end(); ++it) {
        std::cout << *it << " ";
    }
    std::cout << std::endl;

    // 方式三：基于范围的 for 循环 (cpp11 及以后，最现代、最简洁)
    std::cout << "使用范围 for 循环遍历: ";
    for (const int& num : v) { // 使用 const& 避免不必要的拷贝
        std::cout << num << " ";
    }
    std::cout << std::endl;
}
```

#### list（双向链表）
##### 初始化与构造函数(与vector几乎一模一样)
```cpp
int main() {
    // 1. 默认构造
    std::list<int> l1;

    // 2. 带参数构造
    std::list<int> l2(4); //包含4个0
    std::list<int> l3(4, 88); // 包含 4 个 88

    // 3. 列表初始化
    std::list<std::string> l4 = {"apple", "banana", "cherry"};

    // 4. 拷贝构造
    std::list<std::string> l5(l4);

    // 5. 范围构造
    std::vector<int> v = {1,2,3};
    std::list<int> l6(v.begin(), v.end());
}
```
##### 常用成员函数
`list` 的很多成员函数和 `vector` 类似 (`size`, `empty`, `front`, `back`, `insert`, `erase`, `clear`)，不同体现在效率上。
- **不支持随机访问**：`list` **没有** `[]` 和 `at()` 成员函数。
- **特有的修改器**
    - `l.push_front(value)`: 在**开头**添加元素。
    - `l.pop_front()`: 删除**开头**的元素。
    - `l.sort()`: 对链表进行排序。
    - `l.merge(other_list)`: 合并另一个**已排序**的 `list` 到当前 `list` 中，并保持有序。
    - `l.reverse()`: 反转链表元素的顺序。
    - `l.unique()`: 移除连续的重复元素。
##### 遍历
```cpp
int main() {
    std::list<std::string> l = {"cpp", "Java", "Python"};

    // 方式一：使用迭代器
    std::cout << "使用迭代器遍历: ";
    for (std::list<std::string>::iterator it = l.begin(); it != l.end(); ++it) {
        std::cout << *it << " ";
    }
    std::cout << std::endl;

    // 方式二：基于范围的 for 循环 (推荐)
    std::cout << "使用范围 for 循环遍历: ";
    for (const auto& lang : l) {
        std::cout << lang << " ";
    }
    std::cout << std::endl;
}
```
#### map
##### 初始化与构造函数
```cpp
int main() {
    // 1. 默认构造
    std::map<std::string, int> m1;

    // 2. 列表初始化 (最常用)
    std::map<std::string, int> m2 = {
        {"Alice", 25},
        {"Bob", 30},
        {"Charlie", 22}
    };

    // 3. 拷贝构造
    std::map<std::string, int> m3(m2);

    // 4. 范围构造
    std::vector<std::pair<std::string, int>> vec = {{"David", 40}, {"Eve", 28}};
    std::map<std::string, int> m4(vec.begin(), vec.end());
}
```
##### 常用成员函数
###### 元素访问与修改
+ `m[key]`：
	+ 如果key存在，返回对应值的引用
	+ 否则，**自动插入**一个新元素，键为key，值为默认构造的值，然后返回引用
+ `m.at(key)`：带边界检测
+ `m.insert({key, value})`：插入一个键值对，返回一个`std::pair`，其中 `first` 是指向插入元素的迭代器，`second` 是一个 `bool` 值（`true` 表示插入成功，`false` 表示键已存在）。
- `m.erase(key)`: 根据键删除元素
- `m.erase(iterator)`: 根据迭代器删除元素
- `m.clear()`: 清空 `map`
###### 查找
- `m.find(key)`: 查找键为 `key` 的元素。如果找到，返回指向该元素的迭代器；如果找不到，返回 `m.end()`。**这是判断键是否存在的最佳方式。**
- `m.count(key)`: 返回键为 `key` 的元素个数。因为 `map` 的键是唯一的，所以返回值只能是 `0` 或 `1`。
##### 遍历
遍历 `map` 时，得到的是 `std::pair` 对象，你需要通过 `.first` 访问键，通过 `.second` 访问值。遍历的结果是**按键排序**的。
```cpp
int main() {
    std::map<std::string, int> ages = {
        {"Charlie", 22},
        {"Alice", 25},
        {"Bob", 30}
    };

    // 方式一：使用迭代器
    std::cout << "使用迭代器遍历: " << std::endl;
    for (auto it = ages.begin(); it != ages.end(); ++it) {
        std::cout << "  Key: " << it->first << ", Value: " << it->second << std::endl;
    }

    // 方式二：基于范围的 for 循环 (cpp11, 推荐)
    std::cout << "使用范围 for 循环遍历: " << std::endl;
    for (const auto& pair : ages) { // auto 推断为 std::pair<const std::string, int>
        std::cout << "  Key: " << pair.first << ", Value: " << pair.second << std::endl;
    }
```
## Week3
### Declarations vs. Definitions
当你遇到一个语句时，可以这样问自己：
> “编译器在处理这一行时，是否需要为它分配一块新的内存空间（无论是栈上、堆上还是静态数据区）？”
- 如果**是**，那它就是**定义**。
- 如果**否**（它只是在告诉编译器某个东西的“契约”或“签名”，而实体在别处），那它就是**声明**。
### `#include`
+ `#include ""`范围更广
+ `#include <>`先在标准包含目录查找，再在环境变量中查找，再从`-I`查找
## Week4
### Access Control
#### private
注意被声明为private的成员变量和成员函数是可以被**同一类**的对象访问的。
#### friend
##### 友元的类型
+ 全局函数
```cpp
class MyClass { // ... 
friend return_type function_name(parameters); 
};
```
+ 另一个类的成员函数
```cpp
// 步骤 1：前向声明 ClassA
// 目的：让 ClassB 知道 ClassA 是一个类型，这样 ClassB 的成员函数声明中才能使用 ClassA& a 作为参数。
class ClassA; 

// 步骤 2：完整定义 ClassB
// 目的：让编译器知道 ClassB 的完整结构，特别是知道它确实有一个成员函数叫 accessPrivateMembers。
// 注意：此时我们只声明成员函数，不在这里定义它，因为 ClassA 还不完整，无法访问其成员。
class ClassB {
public:
    void accessPrivateMembers(ClassA& a); 
};

// 步骤 3：完整定义 ClassA
// 目的：定义 ClassA 的所有成员，并利用在步骤2中获得的信息，合法地声明友元。
class ClassA {
private:
    int private_data = 42;

public:
    // 因为在步骤2中 ClassB 和它的成员函数都已经被声明，
    // 所以这里的友元声明是合法的。编译器可以查找到 ClassB::accessPrivateMembers 的存在。
    friend void ClassB::accessPrivateMembers(ClassA& a);
};

// 步骤 4：定义 ClassB 的成员函数
// 目的：提供友元函数的具体实现。
// 必须把这一步放在最后，因为直到这里，ClassA 才被完整地定义，
// 函数体内部才能合法地访问 a.private_data。
void ClassB::accessPrivateMembers(ClassA& a) {
    std::cout << "访问成功: a.private_data = " << a.private_data << std::endl;
}
```
+ 友元类
```cpp
class ClassA {
    // ...
    friend class ClassB;
};
```
##### 友元的特性与规则
- **友元关系不能传递**：如果 A是B的友元，B是C的友元，这并不意味着 A 是 C 的友元。
- **友元关系是单向的**：如果 A 是 B 的友元，这并不意味着 B 也是 A 的友元。必须在 A 的定义中也声明 B 为友元才可以。
- **友元关系不能被继承**：基类的友元对派生类没有特殊的访问权限。派生类的友元对基类也没有特殊的访问权限。
### Scope & Lifetime 作用域和生存周期
#### Local objects
- 如果一个局部变量(Local object)和一个成员变量(Field)同名，那么在函数内部，这个名字会指向局部变量，从而“屏蔽”了对同名成员变量的访问 。
#### Global objects
**跨文件依赖问题**：虽然单个文件内的构造顺序是确定的，但不同文件之间的全局对象的构造顺序是**不确定的** 。如果一个文件中的全局对象依赖于另一个文件中的全局对象，就可能引发“静态初始化顺序灾难” 。
- **解决方案**：要么避免这种跨文件的非局部静态依赖，要么将所有相关的静态对象定义放在同一个文件中，并按正确的顺序排列 。
#### Static
+ **函数内部的静态变量/对象** (Static Local Variables)
	- **生命周期 (Lifetime)**：它的生命周期和全局对象一样，贯穿整个程序的运行期间 。它的值在多次函数调用之间是**持久的、被记住的** 。
	- **作用域 (Scope)**：它的作用域和局部变量一样，仅限于定义它的函数内部 。
	- **初始化 (Constructor)**：它只会被**初始化一次** ，即在程序第一次执行到它的定义语句时 。即使这个定义位于一个 `if` 语句块内，只要条件满足，它就会被构造，并且之后即使条件不再满足，它也依然存在且保留其值 。
	- **析构 (Destructor)**：如果静态对象被构造了，它的析构函数会在程序退出时被调用 。
- **类内部的静态成员 (Static Members)**
	- **静态成员变量 (Static Member Variables)**：
	    - 它相当于这个类的专属“全局变量”，被所有对象实例共享 。
	    - 它有类作用域，并遵循 `public`/`private`/`protected` 的访问规则 。
	    - 它必须在类的外部（通常在对应的 `.cpp` 文件中）进行一次定义和初始化 。定义时无需`static`修饰符。
	- **静态成员函数 (Static Member Functions)**：
	    - 它不与任何特定的对象实例绑定，因此它**没有 `this` 指针** 。
	    - 正因为没有 `this` 指针，它**只能访问类的静态成员变量**或其他全局变量/函数，不能访问非静态的成员变量或成员函数 ，而且不能被声明为`virtual`。
	    - 可以通过类名直接调用（如 `MyClass::static_func()`），无需创建对象实例 。
	    - 定义时无需`static`修饰符。
        
| 变量类型   | 作用域 (Scope) | 生命周期 (Lifetime) | 初始化时机 (Init. time) |
| :----- | :---------- | :-------------- | :----------------- |
| 局部变量   | 在 `{}` 内    | 在 `{}` 内        | 在定义行               |
| 全局变量   | 全局          | 全局              | 在定义行，`main()` 之前   |
| 静态局部变量 | 在 `{}` 内    | 全局              | 第一次执行到定义行时         |
| 静态全局变量 | 在文件内        | 全局              | 同全局变量              |
| 成员变量   | 在类内         | 与对象相同           | 对象被创建时             |
| 静态成员变量 | 在类内         | 全局              | 在定义行，`main()` 之前   |
**注**：静态全局变量作用域只在文件内的原因是`static`关键字赋予变量**内部链接**（Internal linkage）
![Global static hidden in file](https://pub-9406cde716e545d3961d40fb93fb239d.r2.dev/images/global_static_hidden.png)
## Week5
### Reference
- 可以建立**指针的引用**，如`int*& p`
- 引用和被引用的对象共享一个地址
- 左值引用只能被绑定到左值上，如果函数的参数可能传进来右值的话，要加`const`，如`void func(const int& x);`
### `const`
- `const`变量默认是内部链接的
	- 所以编译器不会为`const`变量创建存储空间，而是保存在符号表中
	- 如果要在其他文件中使用，定义时应`extern const int limit = 100;`
#### `const`用于聚合类型(Aggregates)
- `const`用于聚合类型会分配内存
- 但其中的元素同普通聚合类型一样，不能被视为“编译时常量”。如：
```cpp
const int i[] = {1, 2, 3, 4}; 
float f[i[3]]; // Illegal

struct S { int i, j; }; 
const S s[] = {{1, 2}, {3, 4}}; 
double d[s[1].j]; // Illegal
```
#### `const`与指针
- 指向`const`的指针:`const char* p;`或`char const* p;`
- `const`指针:`char* const p;`
##### “指向const的指针” 指向 “非const变量”
合法。
- 指针会成功地存储这个非 `const` 变量的地址
- 通过这个“指向 `const` 的指针”，你**不能**修改它所指向的变量的值
- 但是，你仍然可以通过原始的非 `const` 变量名或其他非 `const` 指针来修改它的值
```cpp
int i;
const int *cip;
cip = &i; // 完全正确 

*cip = 54; // 错误！即使 i 不是 const，但因为 cip 是指向 const 的指针，所以不能通过它来修改 
i = 54; // 正确！可以直接修改原始变量
```
##### “普通指针” 指向 “const变量”
编译错误。
```cpp
const int ci = 3;
int *ip;
ip = &ci; // 错误！
```
#### 字符串字面量(string literals)

| 特性          | `char* s = "Hello, world!";` | `char s[] = "Hello, world!";` |
| :---------- | :--------------------------- | :---------------------------- |
| **`s` 的类型** | 字符指针 (Pointer)               | 字符数组 (Array)                  |
| **字符串存储位置** | **只读**内存区域                   | **可写**内存区域 (如栈)               |
| **是否可修改**   | **否** (尝试修改是未定义行为)           | **是**                         |
| **用法建议**    | **不安全，应避免使用**                | **安全，用于需要修改字符串的场景**           |
#### const objects
- 为了维护`const`对象的不变性，只有显式声明为`const`的成员函数才能被`const`对象调用。
##### const member functions
- 在`const`成员函数中，不能调用非`const`的成员函数。
##### const fields
- `const`成员变量**必须**在**初始化列表**中定义！在构造函数体内部对成员的操作都是赋值！
## Week6
### Delegating constructors
- 重要限制：一个构造函数一旦委托了另一个构造函数，它就**不能再有自己的成员初始化列表**了 。
### Default arguments
- 在构造函数中添加默认参数必须从右往左
```cpp
int harpo(int n, int m = 4, int j = 5); 
int chico(int n, int m = 6, int j);//Illegal
int groucho(int k = 1, int m = 2, int n = 3);
```
### Inline functions
- 内联函数的定义必须放在头文件中
```cpp
inline int plusOne(int x); 
inline int plusOne(int x) {return ++x;}
```
- 内联函数的函数体放在头文件中，不会产生多重定义的错误
- 在类内部定义的函数自动成为内联。但是如果想把内联成员函数的定义写在类外部，这是合法的，只是必须写在头文件中
```cpp
// --- NotInline.h ---
class NotInline {
public:
    void doSomething();
};

// --- NotInline.cpp (错误的位置!) ---
#include "NotInline.h"
#include <iostream>

inline void NotInline::doSomething() {
    std::cout << "Doing something...\n";
}

// --- NotInline.h ---
// 正确的做法：将 inline 函数的定义紧跟在类声明之后，放在同一个头文件中 
inline void CorrectInline::doSomething() { 
std::cout << "Doing something correctly...\n"; 
}
```
## Week7
### Composition
- 初始化列表
```cpp
// CPU 类
class CPU {
private:
    int coreCount; // 核心数

public:
    // CPU 的构造函数，需要一个参数
    CPU(int cores) : coreCount(cores) {}
};

// Memory 类
class Memory {
private:
    int sizeGB; // 容量大小

public:
    // Memory 的构造函数，需要一个参数
    Memory(int size) : sizeGB(size) {}
};

// Computer 类，它包含 CPU 和 Memory 对象
class Computer {
private:
    std::string modelName;
    CPU cpu;           // 成员对象1
    Memory memory;     // 成员对象2

public:
    // 使用“初始化列表”的构造函数
    Computer(const std::string& model, int cpuCores, int memSize)
        // --- 这就是初始化列表 ---
        : modelName(model),          // 初始化内置类型成员
          cpu(cpuCores),             // 为 cpu 成员调用 CPU(cpuCores) 构造函数
          memory(memSize)            // 为 memory 成员调用 Memory(memSize) 构造函数
    {}
};
```
## Week8
### Inheritance
#### 继承了什么？

当一个类继承自另一个类时，它获得了基类的几乎所有东西，但它们的可见性（访问权限）会有所不同：

- **公共成员 (public)**：基类的 `public` 成员函数也成为派生类的 `public` 成员函数，可以被外部直接调用。
    
- **保护成员 (protected)**：基类的 `protected` 成员对于派生类是完全可见和可访问的，但对于类的外部（客户端代码）是不可见的。 这是一种介于 `public` 和 `private` 之间的访问级别。
    
- **私有成员 (private)**：基类的 `private` 成员变量虽然存在于派生类对象中，但派生类**不能直接访问**它们。 必须通过基类提供的 `public` 或 `protected` 成员函数来间接访问。
    
- **静态成员 (static)**：基类的静态成员也被继承，并且在所有派生类对象之间共享。
#### 没有继承什么？

以下内容是基类特有的，不会被派生类继承：

- **构造函数 (Constructors)**：每个类负责构造自己的对象。派生类必须调用基类的构造函数来初始化从基类继承来的部分。
    
- **析构函数 (Destructors)**：同样，每个类负责自己的销毁过程。
    
- **赋值运算符 (operator=)**：派生类可以有自己的赋值逻辑。
#### Name hiding
- 如果你在派生类中定义了一个与基类中某个函数同名的函数，那么基类中**所有**同名的重载函数（即使参数列表不同）都会被隐藏起来，无法直接访问。

- **解决名称隐藏**：可以使用 `using` 声明将基类的函数引入到派生类的作用域中。
```cpp
class Derived : public Base {
public:
    // 将 Base 类的所有 f 函数都引入到 Derived 的作用域
    using Base::f;

    void f(int) { /* ... */ } // 定义自己的版本
};
```
#### 构造函数与析构函数
- **构造顺序**：创建派生类对象时，总是**先调用基类的构造函数**，然后再调用派生类的构造函数。
    
- **调用基类构造函数**：你需要在派生类构造函数的**成员初始化列表**中显式地调用基类的构造函数来传递参数。 如果不显式调用，编译器会尝试调用基类的默认（无参）构造函数。
 ```cpp
// Employee (基类) 的构造函数
Employee::Employee(const string& name, const string& ssn)
    : m_name(name), m_ssn(ssn) {
    // ...
}
    
// Manager (派生类) 的构造函数
// 在初始化列表中调用 Employee 的构造函数
Manager::Manager(const string& name, const string& ssn, const string& title)
    : Employee(name, ssn), m_title(title) { 
    // ...
}
```
-  **析构顺序**：析构函数的调用顺序与构造函数**完全相反**。先调用派生类的析构函数，再调用基类的析构函数。
## Week9
### Polymorphism
+ 如果一个类可能被继承，它的析构函数**必须**声明为 `virtual`
+ 在派生类的重写函数中，可以使用 `基类名::函数名()` 的语法来调用基类被覆盖的版本 
```cpp
void Derived::func() {
    cout << "派生类增加的新功能";
    Base::func(); // 调用基类的版本以复用代码 
}
```
- 重写虚函数时，如果基类版本返回基类的指针或引用（如 `B*`），派生类版本可以返回派生类的指针或引用（如 `D*`）
```cpp
class Expr {
public:
    virtual Expr* clone();
};
class BinaryExpr : public Expr {
public:
    virtual BinaryExpr* clone(); // 正确，返回类型更具体 
};
```
- 如果你只重写了基类中重载函数的一部分变体，那么基类中其他未被重写的变体将被**name hidden** 。
## Week11
### Overloaded Operator
下表总结了各种常用运算符的重载格式：

| 运算符 (Operator)      | 推荐定义方式        | 通用格式 (作为成员函数)                                                             | 通用格式 (作为全局/友元函数)                                                                              |
| :------------------ | :------------ | :------------------------------------------------------------------------ | :-------------------------------------------------------------------------------------------- |
| **二元算术**`+ - * / %` | 全局友元函数        | `const T T::operator+(const T& rhs) const;`                               | `const T operator+(const T& lhs, const T& rhs);`                                              |
| **关系运算**`== != < >` | 全局友元函数        | `bool T::operator==(const T& rhs) const;`                                 | `bool operator==(const T& lhs, const T& rhs);`                                                |
| **流插入/提取**`<< >>`   | **必须**是全局友元函数 | (不适用)                                                                     | `ostream& operator<<(ostream& os, const T& obj);` `istream& operator>>(istream& is, T& obj);` |
| **赋值**`= += -= *=`  | **必须**是成员函数   | `T& T::operator=(const T& rhs);`                                          | (不适用)                                                                                         |
| **下标**`[]`          | **必须**是成员函数   | `T& T::operator[](int index);`                                            | (不适用)                                                                                         |
| **自增/自减**`++ --`    | 成员函数          | **前缀**: `const T& T::operator++();` **后缀**: `const T T::operator++(int);` | (不适用)                                                                                         |
**关键点解释**：
- **返回 `const T`**: 对于算术运算符，返回 `const` 对象可以防止出现 `(a + b) = c;` 这样无意义的赋值操作 。
    
- **返回 `T&`**: 赋值运算符和下标运算符返回引用，是为了支持链式操作（如 `a = b = c;`）和赋值操作（如 `v[i] = 10;`） 。
    
- **后缀 `++` 的 `int` 参数**: 后缀自增/自减运算符的`int`参数仅用作一个标记，以区别于前缀版本，它没有实际名称，也不会在函数体中使用 。
	
- **后缀`++`和前缀`++`返回类型不同**：后缀的`++`要返回的是增加前的值，在函数体内部就需要先定义一个对象存储增加前的值，然后将其返回。前缀的`++`返回增加后的值，那我们只需要返回被增加对象的引用，这样可以提高效率。
    
- **流运算符**: 必须返回流的引用，以支持链式I/O操作（如 `cout << a << b;`） 。
## Week12
### Template
#### Function Templates
##### Overloading rules
1. **首先，检查是否存在唯一的常规函数匹配 (Check first for unique function match)**：编译器会先寻找一个不需要通过模板实例化的、能够精确匹配参数类型的常规（非模板）函数。如果找到了一个且仅有一个这样的函数，就会选择它。
2. **然后，检查是否存在唯一的函数模板匹配 (Then check for unique function template match)**：如果在第一步中没有找到精确匹配的常规函数，编译器就会尝试使用函数模板。它会看是否能通过模板推导出唯一的参数类型来生成一个匹配的函数实例。
3. **最后，在常规函数中进行重载 (Then do overloading on functions)**：如果以上步骤都无法确定唯一的匹配项（例如，有多个常规函数或多个模板都能匹配），编译器会应用标准的函数重载规则来解决歧义，这可能涉及到类型转换等。需要注意的是，**函数模板的匹配不应用隐式类型转换。**
##### Instantiation
- **隐式推导**：编译器从传递给函数的实际参数中推导出模板类型
- **显式指定**：当函数**参数列表**中没有包含模板参数 `T` 类型的参数时，编译器就无法从函数调用中自动推导出 `T` 是什么。这种情况下，你就必须手动告诉编译器 `T` 应该是什么类型
```cpp
template < class T >
void foo(void) { /*...*/ }

foo<int>();   // type T is int
foo<float>(); // type T is float
```
#### Class Templates
##### Expression parameters
```cpp
template <class T, int bounds = 100> // "int bounds" 就是一个非类型参数，可以有默认值
class FixedVector {
public:
    FixedVector();
    T& operator[](int);
private:
    // 非类型参数在这里用来决定数组的大小
    T elements[bounds]; // 一个固定大小的数组! 
};
```
##### Templates and inheritance
- **类模板可以从非模板类继承**
```cpp
template <class A>
class Derived: public Base {
```
- **类模板可以从另一个类模板继承**
```cpp
template <class A>
class Derived: public List<A> {
```
- **非模板可以从模板类继承**
```cpp
class SupervisorGroup : public
List<Employee*> {
```
## Week13
### Exceptions
#### 异常发生后的流程总结
- **寻找`try`块**：程序会首先检查当前位置是否在一个`try`块内部。
	- **在`try`块内**：程序会按顺序检查这个`try`块后面跟着的`catch`处理器。
		- 如果找到了能匹配异常类型的`catch`块，就执行该`catch`块内的代码，然后跳转到整个`try-catch`结构后面的第一条语句继续执行。
		- 如果找不到匹配的`catch`块，就和不在`try`块内的情况一样处理（见下一步）。
	- **不在`try`块内**：程序会立即退出当前的函数（或代码块），这个过程被称为“栈回退”（stack unwinding）。在退出过程中，当前作用域内所有已创建的局部对象的析构函数都会被调用。然后，程序返回到这个函数的调用点，把那个调用点当作新的异常抛出点，重复第1步的流程。
这个过程会一直持续下去，直到找到一个匹配的`catch`块，或者直到主函数`main`都退出了还没找到，那样程序就会调用`std::terminate()`异常终止。
#### Exceptions & new
- `new`在失败时不会返回0
- `new`在失败时抛出`bad_alloc`的异常类
```cpp
void func(){
	try{
		while(1){
			char *p = new char[10000];
		}
	}catch(bad_alloc& e){
		//....
	}
}
```
#### Exceptions & constructors
- 在构造函数中抛出异常时，由于构造函数未执行完毕，**析构函数将不会被调用**。此时已分配的资源必须手动释放。
```cpp
class Risky {
public:
    Risky() {
        resource1_ = new int[100]; // 1. 分配了资源
        // ... 假设这里发生了错误 ...
        throw std::runtime_error("Failed to acquire resource 2!"); // 2. 抛出异常
        // 因为异常抛出，构造函数终止，析构函数不会被调用
        // resource1_ 指向的内存就泄露了！
    }
    ~Risky() { delete[] resource1_; }
private:
    int* resource1_;
};
```
- **Two stages construction**解决了这一问题。
	- 构造函数中不执行任何可能失败的工作，所有的指针成员都初始化为`nullptr`
	- 定义一个`Init()`函数执行额外的初始化工作
## 零碎知识点
- 一旦有了含参的构造函数，编译器不会隐式地创建默认构造函数。
- 类型转换操作符
	- `static_cast`:
- **lambda表达式**:
```cpp
[capture_clause](parameters) -> return_type {
    // 函数体
    statement;
};
```
# 回忆卷
## 23-24春夏
### 单选题
CA*D*C*D* *B*C*C*B*D*
**CADAD BCCBC**
### 结果填空题
1. value of b is less than zero
2. `FuncA`
   `FuncB`
   ID:10
   Main
3. `A<double>`
   `A<T>`
   `A<int>`
4. ~~`HaHoHoHey`~~ `HoHaHey`
5. using namespace A20
   ~~using namespace B20.0~~ using namespace B20
6. `$C1()$$C2()$`
   `$C1(const C1&)$`
   ~~`$~C2()$$~C1()$`~~ `$~C1()$$~C2()$$~C1()$`
### 程序填空题
1. `nullptr`
   `T`
   `Array<T>`
   `Array<T>::`
   `data[i]`
   `Array<T>`
   `Array<T>::`
   ~~`iterate(void(*f)(T&))`~~ `iterate(f)`
   `<int>`
2. `template`
   `BinaryOp1`
   `BinaryOp2`
   `op1`
   ~~`first1, first2`~~ `*first1, *first2`
   `++first2`
### 主观题
```cpp
class Rectangle : public shape
{
public:
	Rectangle() : lbx(0), lby(0), w(0), h(0){
	
	}
	~Rectangle(){
		
	}
	void draw(){
		std::cout << "Rectangle " << lbx << " " << lby
		          << " w&h " << w << " " << y << std::endl;
	}
	bool parseattribute(ifstream &ifs){
		
	}
private:
	double lbx;
	double lby;
	double w;
	double h;
};

class Circle : public shape
{
public:
	Circle() : ctrx(0), ctry(0), r(0){
	
	}
	~Circle(){
	
	}
	void draw(){
		std::cout << "Circle " << ctrx << " " << ctry 
		          << " radius " << r;
	}
	bool parseattribute(ifstream &ifs){
	
	}
private:
	double ctrx;
	double ctry;
	double r;
};

class Ellipse : public shape
{
public:
	Ellipse() : ctrx(0), ctry(0), r1(0), r2(0){
	
	}
	~Ellipse(){
	
	}
	void draw(){
		std::cout << "Ellipse " << ctrx << " " << ctry
				  << " radius " << r1 << r2;
	}
	bool parseattribute(ifstream &ifs){
	
	}
private:
	double ctrx;
	double ctry;
	double r1;
	double r2;
};
```
## 19-20春夏
### 填空题
1. ~~Hi~~ H
   H
   i
2. `A()`
   `A()`
   `B()`
   `~B()`
   `~A()`
   `~A()`
3. 9
   -9
4. A
   A
   B
   A
   C
5. i
   d
6. `B::F(double)`
   `B::F(double)`
   `A::F2(int)`
7. B
   1
8. 5.7
   5
9. 1
10. ~~`operator[](int)`~~ `operator[](int)const`
   ~~`operator[](int)const`~~ `operator[](int)`
11. `f(double)`
12. ~~OK1~~ FAIL
   ~~FAIL~~ OK2
   OK3
   OK4
13. 5---4
   5---6
14. `A()`
   `A()`
   `operator=(const A&)`
   `A(const A&)`
15. I'm in Derived
   I'm in Derived
   Destructing Derived
   Destructing Base
### 程序填空题
1. `m_pNext = &n`
   ~~`strlen(s)`~~ `strlen(s) + 1`
   `delete[] m_s`
   `Node* q = p -> m_pNext`
   `p = q`
   `&n`
   `const`
   `p = p -> m_pNext`
   `* new`
   `* new`
2. `this -> numerator = numerator`
   `this -> denominator = denominator`
   `const Fraction&`
   `denominator`
   `operator`
   `Fraction`
   `const Fraction& f1`
   `f1.numerator * denominator`
   `friend`
   `Fraction(f1.numerator * denominator + numerator * f1.denominator, denominator * f1.denominator)`
### 程序设计题
```cpp
template<typename T>
class CQueue{
private:
	const int queueSize;
	int head;
	int rear;
	T* data_buff;
public:
	CQueue(int s = 10) : queueSize(s){
		data_buff = new T[s];
		head = 0;
		rear = 0;
	}
	~CQueue(){
		delete [] data_buff;
	}
	int getSize() const{
		return queueSize;
	}
	int getNumbers() const{
		return (rear - head + queueSize) % queueSize;
	}
	T getHead(){
		return data_buff[head];
	}
	void enQueue(const T& value){
		if(!isFull()){
			data_buff[rear] = value;
			++rear;
			rear %= queueSize;
		}else{
			throw std::overflow_error oe;
		}
	}
	T deQueue(){
		if(!isEmpty()){
			int t = head;
			++head;
			head %= queueSize;
			return data_buff[t];
		}else{
			throw std::underflow_error ue;
		}
	}
	bool isEmpty() const{
		return ((rear - head) % queueSize == 0);
	}
	bool isFull() const{
		return ((rear + 1 - head) % queueSize == 0);
	}
	void show() const{
		for (int i = head; i < rear; ++i){
			std::cout << data_buff[i] << " ";
		}
	}
}
```
## 18-19春夏
### 判断题
1. T
2. T
3. F
4. T
5. T
6. T
7. T
8. T
9. F
10. T
### 单选题
1. D
2. C
3. B
4. C
5. C
6. B
7. B
8. C
9. C
10. C
### 结果填空题
1. 110220
2. ~~131242~~ 131422
3. ~~21~~ 121
4. 1
   3
   5
5. 0
   0
   1
   1
6. 122
7. 1
   2
   3
   11
   12
8. dog! 
   dog!
   pet!
9. 0
### 程序填空题
1. `template<typename T>`
   `T*`
   `T`
   `0`
   ~~`val`~~ `T val`
   ~~`[i][j]`~~ `[i*ncols + j]`
   `val < min`
   `val > max`
   ~~`+= val`~~ `=avg + static_cast<double>(val)`
   `nrows * ncols`
2. `char[strlen(ptr) + 1]`
   `delete[] m_ptr`
   `char[strlen(m_ptr) + strlen(str.m_ptr) + 1]`
   `delete[]`
   `m_ptr`
   `*this`
   `friend`
   `std::ostream&`
   `try`
   `catch`
3. `T*`
   `T[maxsize]`
   `delete[] data`
   `front == rear`
   `(rear + 1 - front) % capacity == 0`
   `data[rear]`
   `(rear + 1) % capacity`
   ~~`top = data[front]`~~ `T top = data[front]`
   `(front + 1) % capacity`
   `Queue<double>`

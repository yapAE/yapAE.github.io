---
title: golang print struct
date: 2017-11-30 17:24:25
tags: [golang,struct]
categories: golang
---
## golang 如何打印出结构体struct的全部信息？
在程序调试中，经常用到fmt.Println(a)或者fmt.Printf("%v",a)。
```
package main
import "fmt"

type Eg struct {
   name string
   age  int  
}

func main() {
     a: = Eg{"tom",21}
     fmt.Println(a)
     fmt.Printf("%v",a)
     fmt.Printf("%+v",a)
}
```
此例输出：
```
{tom 21}
{tom 21}{name:tom age:21}
```
## 知识拓展
Printf 类的函数，都有一个不接受任何格式化的Print 函数，等价于对每一个操作数都应用 %v。另一个变参函数 Println 会在操作数之间插入空白，并在末尾追加一个换行符。
### 占位符

#### 普通占位符
 在打印结构体时，“加号”标记（%+v）会添加字段名

占位符                        说明                        举例                                        输出
%v        相应值的默认格式。                            Printf("%v", site)，Printf("%+v", site)   {studygolang}，{Name:studygolang}
%#v       相应值的Go语法表示                            Printf("#v", site)                        main.Website{Name:"studygolang"}
%T        相应值的类型的Go语法表示                      Printf("%T", site)                        main.Website
%%        字面上的百分号，并非值的占位符                Printf("%%")                              %

#### 布尔占位符
占位符                        说明                        举例                                        输出
%t        单词 true 或 false。                            Printf("%t", true)                        true

#### 整数占位符
占位符                        说明                        举例                                    输出
%b        二进制表示                                    Printf("%b", 5)                        101
%c        相应Unicode码点所表示的字符                    Printf("%c", 0x4E2D)                中
%d        十进制表示                                    Printf("%d", 0x12)                    18
%o        八进制表示                                    Printf("%d", 10)                    12
%q        单引号围绕的字符字面值，由Go语法安全地转义        Printf("%q", 0x4E2D)                '中'
%x        十六进制表示，字母形式为小写 a-f                Printf("%x", 13)                    d
%X        十六进制表示，字母形式为大写 A-F                Printf("%x", 13)                    D
%U        Unicode格式：U+1234，等同于 "U+%04X"            Printf("%U", 0x4E2D)                U+4E2D
#### 浮点数和复数的组成部分（实部和虚部）
占位符                        说明                                                举例                                    输出
%b        无小数部分的，指数为二的幂的科学计数法，与 strconv.FormatFloat    
        的 'b' 转换格式一致。例如 -123456p-78
%e        科学计数法，例如 -1234.456e+78                                    Printf("%e", 10.2)                            1.020000e+01
%E        科学计数法，例如 -1234.456E+78                                    Printf("%e", 10.2)                            1.020000E+01
%f        有小数点而无指数，例如 123.456                                    Printf("%f", 10.2)                            10.200000
%g        根据情况选择 %e 或 %f 以产生更紧凑的（无末尾的0）输出                Printf("%g", 10.20)                            10.2
%G        根据情况选择 %E 或 %f 以产生更紧凑的（无末尾的0）输出                Printf("%G", 10.20+2i)                        (10.2+2i)
#### 字符串与字节切片
占位符                        说明                                                举例                                    输出
%s        输出字符串表示（string类型或[]byte)                            Printf("%s", []byte("Go语言中文网"))        Go语言中文网
%q        双引号围绕的字符串，由Go语法安全地转义                            Printf("%q", "Go语言中文网")                "Go语言中文网"
%x        十六进制，小写字母，每字节两个字符                                Printf("%x", "golang")                        676f6c616e67
%X        十六进制，大写字母，每字节两个字符                                Printf("%X", "golang")                        676F6C616E67
#### 指针
占位符                        说明                                                举例                                    输出
%p        十六进制表示，前缀 0x                                            Printf("%p", &site)                            0x4f57f0
#### 其他占位符标记
占位符                        说明                                                举例                                    输出
\+        总打印数值的正负号；对于%q（%+q）保证只输出ASCII编码的字符。            Printf("%+q", "中文")                    "\u4e2d\u6587"
\-        在右侧而非左侧填充空格（左对齐该区域）
\#        备用格式：为八进制添加前导 0（%#o），为十六进制添加前导 0x（%#x）或    Printf("%#U", '中')                        U+4E2D '中'
        0X（%#X），为 %p（%#p）去掉前导 0x；如果可能的话，%q（%#q）会打印原始
        （即反引号围绕的）字符串；如果是可打印字符，%U（%#U）会写出该字符的
        Unicode 编码形式（如字符 x 会被打印成 U+0078 'x'）。
' '        （空格）为数值中省略的正负号留出空白（% d）；
        以十六进制（% x, % X）打印字符串或切片时，在字节之间用空格隔开
0        填充前导的0而非空格；对于数字，这会将填充移到正负号之后

##  Print 序列函数
这里说的 Print 序列函数包括：Fprint/Fprintf/Fprintln/Sprint/Sprintf/Sprintln/Print/Printf/Println。之所以将放在一起介绍，是因为它们的使用方式类似、参数意思也类似。

一般的，我们将Fprint/Fprintf/Fprintln归为一类；Sprint/Sprintf/Sprintln归为一类；Print/Printf/Println归为另一类。其中，Print/Printf/Println会调用相应的F开头一类函数。如：

func Print(a ...interface{}) (n int, err error) {
    return Fprint(os.Stdout, a...)
}
Fprint/Fprintf/Fprintln 函数的第一个参数接收一个io.Writer类型，会将内容输出到io.Writer中去。而Print/Printf/Println 函数是将内容输出到标准输出中，因此，直接调用F类函数做这件事，并将os.Stdout作为第一个参数传入。

Sprint/Sprintf/Sprintln 是格式化内容为string类型，而并不输出到某处，需要格式化字符串并返回时，可以用次组函数。

在这三组函数中，S/F/Printf函数通过指定的格式输出或格式化内容；S/F/Print函数只是使用默认的格式输出或格式化内容；S/F/Println函数使用默认的格式输出或格式化内容，同时会在最后加上"换行符"。

Print 序列函数的最后一个参数都是 a ...interface{} 这种不定参数。对于S/F/Printf序列，这个不定参数的实参个数应该和formt参数的占位符个数一致，否则会出现格式化错误；而对于其他函数，当不定参数的实参个数为多个时，它们之间会直接（对于S/F/Print）或通过" "（空格）（对于S/F/Println）连接起来（注：对于S/F/Print，当两个参数都不是字符串时，会自动添加一个空格，否则不会加。感谢guoshanhe1983 反馈。官方 effective_go 也有说明）。利用这一点，我们可以做如下事情：

result1 := fmt.Sprintln("studygolang.com", 2013)
result2 := fmt.Sprint("studygolang.com", 2013)
result1的值是：studygolang.com 2013，result2的值是：studygolang.com2013。这起到了连接字符串的作用，而不需要通过strconv.Itoa()转换。

Print序列函数用的较多，而且也易于使用（可能需要掌握一些常用的占位符用法），接下来我们结合fmt包中几个相关的接口来掌握更多关于Print的内容。

## Scanning
一组类似的函数通过扫描已格式化的文本来产生值。Scan、Scanf 和 Scanln 从 os.Stdin 中读取；Fscan、Fscanf 和 Fscanln 从指定的 io.Reader 中读取； Sscan、Sscanf 和 Sscanln 从实参字符串中读取。Scanln、Fscanln 和 Sscanln 在换行符处停止扫描，且需要条目紧随换行符之后；Scanf、Fscanf 和 Sscanf 需要输入换行符来匹配格式中的换行符；其它函数则将换行符视为空格。

Scanf、Fscanf 和 Sscanf 根据格式字符串解析实参，类似于 Printf。例如，%x 会将一个整数扫描为十六进制数，而 %v 则会扫描该值的默认表现格式。

格式化行为类似于 Printf，但也有如下例外：

%p 没有实现
%T 没有实现
%e %E %f %F %g %G 都完全等价，且可扫描任何浮点数或复数数值
%s 和 %v 在扫描字符串时会将其中的空格作为分隔符
标记 # 和 + 没有实现
在使用 %v 占位符扫描整数时，可接受友好的进制前缀0（八进制）和0x（十六进制）。

宽度被解释为输入的文本（%5s 意为最多从输入中读取5个 rune 来扫描成字符串），而扫描函数则没有精度的语法（没有 %5.2f，只有 %5f）。

当以某种格式进行扫描时，无论在格式中还是在输入中，所有非空的连续空白字符 （除换行符外）都等价于单个空格。由于这种限制，格式字符串文本必须匹配输入的文本，如果不匹配，扫描过程就会停止，并返回已扫描的实参数。

在所有的扫描参数中，若一个操作数实现了 Scan 方法（即它实现了 Scanner 接口）， 该操作数将使用该方法扫描其文本。此外，若已扫描的实参数少于所提供的实参数，就会返回一个错误。

所有需要被扫描的实参都必须是基本类型或 Scanner 接口的实现。

注意：Fscan 等函数会从输入中多读取一个字符（rune），因此，如果循环调用扫描函数，可能会跳过输入中的某些数据。一般只有在输入的数据中没有空白符时该问题才会出现。若提供给 Fscan 的读取器实现了 ReadRune，就会用该方法读取字符。若此读取器还实现了 UnreadRune 方法，就会用该方法保存字符，而连续的调用将不会丢失数据。若要为没有 ReadRune 和 UnreadRune 方法的读取器加上这些功能，需使用 bufio.NewReader。

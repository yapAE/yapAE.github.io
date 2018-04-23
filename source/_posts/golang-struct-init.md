---
title: golang struct init
date: 2017-12-06 15:03:52
tags: [golang,struct]
---
^在Go语言中，未进行初始化的变量都会被初始化为该类型的零值，例如bool类型的零值为false, int类型的零值为0, string类型的零值为空字符串． 在Go语言中没有构造函数的概念,对象的创建通常交由一个全局的创建函数来完成,以NewXXX来命令,表示"构造函数":

```
type UserInfo struct {
	Username string
	Age int
	Id  int
} 

func NewUserInfo(username string,age,id int){
	return &UserInfo{username,age,id}
}
```

^ 结构体的初始化，因为使用了new()函数和&操作符，这几个变量全部是指向UserInfo结构的指针，即它们是指针变量。

```
 a1 := new(UserInfo)
 a2 := &UserInfo{}
 a3 := &UserInfo{"zhangsan",23,3}
 a4 := &UserInfo{Username:"zhangsan"}
```
直接定义，将获得一个UserInfo{}类型的变量。

```
b1 := UserInfo{}
b2 := UserInfo{Username:"zhangsan"}
```


用 new 分配内存 内建函数 new 本质上说跟其他语言中的同名函数功能一样：new(T) 分配了零值填充的 T 类型的内存空间，并且返回其地址，一个 *T 类型的值。用 Go 的术语说，它返回了一个指针，指向新分配的类型 T 的零值。记住这点非常重要。 这意味着使用者可以用 new 创建一个数据结构的实例并且可以直接工作。如 bytes.Buffer的文档所述 “Buffer 的零值是一个准备好了的空缓冲。” 类似的，sync.Mutex 也没有明确的构造函数或 Init 方法。取而代之，sync.Mutex 的零值被定义为非锁定的互斥量。 零值是非常有用的。务必记得 make 仅适用于 map，slice 和 channel，并且返回的不是指针。应当用 new获得特定的指针。


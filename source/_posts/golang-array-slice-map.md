---
title: golang array slice map
date: 2017-07-14 14:26:28
tags:
---
# golang 中array\slice\map之间的区别


## 声明和初始化
1、指明存储数据的类型；2、存储元素的数量
### 数组： 
	var array [5]int
	array=[5]int{1,2,3,4,5}
	以上两步可以省略为array:=[5]int{1,2,3,4,5} 或者 array:=[...]int{1,0,3,0,5} 也可以array:=[5]int{1:2,3:9}
### 切片：
	slice:=make([]int,5)默认切片容量是其长度，也可以指定其容量slice:=make([]int,5,10)
	slice:=[]int{1,2,3,4,5}或者slice:=[]int{4:2}切片不用数组那样制定[]中的值。
	var nliSlice []int nil切片表示不存在的切片，slice:=[]int{}而空切片表示一个空集合，它们各有用处。
eg:
对于底层数组容量是k的切片slice[i:j]来说
长度：j-i len()
容量:k-i  cap()
slice := []int{1, 2, 3, 4, 5}
slice1 := slice[:]
slice2 := slice[0:]
slice3 := slice[:5]
### map:
	dict=make(map[string]int)
	dict["sa"] = 6 
	以上可以简写dict:=map[string]int{"sa":6,"yue":2}
## 使用
### 数组：
	array[1]=3 //修改
### 切片：
	slice[1]=3 //  newSlice=append(newSlice,10,20,30)
### map:
	dict["sa"]=6 
	age,exists := dict["sa"] ;delete(dict,"alibaba")
## 遍历
	for i,k = range array{
	fmt.Println("索引:%d,值:%d\n",i,v)
}
	
	for i,k = range slice{
	fmt.Println("索引:%d,值:%d\n",i,v)
}

	for key,value =range dict{
	fmt.Println(key,value)
}

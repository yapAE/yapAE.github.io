---
title: about/array_map
date: 2017-07-07 16:51:55
tags:
---
# 关于array_map和array_walk
## array_map
array array_map ( callable $callback , array $array1 [, array $... ] )
返回值是一个数组
## array_walk
bool array_walk ( array &$array , callable $callback [, mixed $userdata = NULL ] )
返回值是一个布尔值
## 两者的不同之处
|------|---------|
 map    主要是为了得到你的回调函数处理后的新数组，要的是结果。
 map    主要是对数组中的值进行操作后返回数组，以得到一个新数组

 walk   主要是对每个参数都使用一次你的回调函数，要的是处理的过程。
 walk   可以认为提供额外参数给回调函数，map不可以
 walk   主要是要对数组内的每个值进行操作，操作结果影响原来的数组
 walk   可以没有返回值 map要有，因为要填充数组

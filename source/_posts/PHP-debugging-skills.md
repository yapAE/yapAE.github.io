---
title: PHP debugging skills
date: 2017-07-04 12:47:29
tags:
---
# php 初学者的一些调试技巧
程序不是一次成型，遇到问题了，怎么定位问题，初学者请看以下：
法宝１：
ini_set('display_errors',true);ini_set('error_reporting',E_ERROR);

程序前面加上这个语句，会有明确的错误提示。
法宝２：
die('L:'.__LINE__);
出了问题，在疑似有问题的地方插入一句，直到不出现‘L:行数’，可以确定此句前一行存在问题。

法宝3：
var_dump(变量1,变量2,...,变量n);die('L:'.__LINE__);
看到的是不是预想的？

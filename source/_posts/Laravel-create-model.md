---
title: Laravel create model
date: 2017-07-05 20:48:39
tags:
---
laravel的 Eloquent 模型其实就是我们平时说的MVC里Model，只是换了个名字而已~

 

1）Eloquent 是啥？

Eloquent 本质就一个查询构建器（laravel里叫查询构建器，想上面所说的一样，它其实就是一个Model），所以它使用查询构建器的所以方法，

如果你不知道laravel查询构建器都有些什么方法，看这里：http://www.cnblogs.com/tujia/p/6292832.html

 

2）Eloquent 怎么用？

1、创建一个Eloquent 模型（生成的model方法位于app目录下）

php artisan make:model Goods
 

2、指定一下Model绑定的数据表及表主键（如果不声明表名及主键，默认的表名是model名字的复数，例如我这里的话，默认表名就成了Goodss了，默认主键是id）

复制代码
<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Goods extends Model
{
    protected $table         = "goods";
    protected $primaryKey     = "goods_id";
    //
}
复制代码
 

3、数据库操作的话，这按之前的查询构建器的写法来就行了，不过这里不再是用的 DB::table('table_name') 了，直接用$this就行了，例如：

$goods = $this->where('goods_id', '1')->first();
当然，这时在Model里方法的写法，在别的地方（例如控制器）调用Model的话，要实例化一个模型来调用

$goods = \App\Goods::where('goods_id', '1')->first();
如果我们需要通过模型查询多次的话，先实例化一个模型并赋值给一个变量是一个不错的选择

$goodsModel = new \App\Goods();
$row        = $goodsModel->where('goods_id', $id)->first();
$count      = $goodsModel->count();
 

3）Eloquent 模型特有的方法

Eloquent 除了具备 “查询构建器” 的所有功能（方法），它还自己的一些“更强大”的方法（DB::table不能使用的方法）

1、find 方法，find 方法可以查询一行或多行

$goodsModel = \App\Goods();
$one        = $goodsModel->find(1);
$some       = $goodsModel->find([1,2,3,4]);
 

2、save 方法，save 方法具备 insert 方法和 update 方法的功能（记录不存在时insert，记录存在时update）

复制代码
$model->save(
    ['email' => 'john@example.com', 'votes' => 0]
);

$model->save(
    ['id'=>1,'email' => 'john@example.com', 'votes' => 0]
);
复制代码
更新时，需要提示数据表的主键字段，例如上面的id字段

PS：如果你在做数据迁移时，有设置到 $table->timestamps()，生成数据表时会有一个 created_at 字段 和 updated_at 字段，而使用save方法插入或更新记录时，这两个字段会被自动更新（使用insert和update方法没这种效果）

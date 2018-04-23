---

title: Laravel-select-update-delete-insert

date: 2017-07-05 16:11:44

tags:

---

Laravel框架——增删改查

增：

//save返回true false

$res = new member();

res->username = 'a';

$res->password = 'b';

dd($res->save());

　　

//返回插入数据的数组array

$res = member::create(['username'=>'add','password'=>'addp'])->asArray();

dd($res);

//create只能添加一条，如果需要批量插入用insert

Member::insert($data)

 

//先去数据库中找，如果没有找到则创建，返回的都是对象

$res = member::firstOrCreate(['username'=>'asfsds']);

dd($res['id']);

　　

删：

 

//通过主键删除 返回删除的条数

$res = member::destroy(13);

member::destroy([1, 2, 3]);

member::destroy(1, 2, 3);

dd($res);

　　

//通过查询删除，返回删除条数

$res = member::where('id',12)->delete();

dd($res);

　　

改：

//返回修改成功的条数

$res = member::where('username','XJ')->update(['username'=>'xj']);

dd($res);

 

//save()返回true or false

$res = member::where('username','xj')->first();

$res->username = 'XJ';

if ($res->save()){

    dd('修改成功');

} else {

     dd('修改失败');

}

　　

查：

　　查询一条信息：

// 通过主键获取模型...

model::find(1);

// 获取匹配查询条件的第一个模型...

model::where('id', 1)->first();

//如果有时候你可能想要在模型找不到的时候抛出异常(如果没找到跳转到404页面)

model::findOrFail(1);

model::where('id','>',0)->firstOrFail();

　　

　　获取聚合：例如count、sum、max　

model::where('active', 1)->count();

model::where('active', 1)->max('col');

　　判断查询结果是否为空，并且转成数组　　

$result = Model::where(...)->get();

//不为空则

if ($result->first()) { }

if (!$result->isEmpty()) { }

if ($result->count()) { }

　　多条件查询：

$res = member::where('id','>',0)->where('username','aaa')->get();

or

$res = member::where([['id','>',0],['username','aaa']])->get();

　　IN查询

//可以用get获取单个字段，但是也必须是数组类型

$res = member::whereIn('id',[1,2,3])->get(['username'])->toArray();

$res = member::whereNotIn('id',[1,2,3])->get()->toArray();

　　between查询

$res = member::whereBetween('id',[1,3])->get()->toArray();

$res = member::whereNotBetween('id',[1,3])->get()->toArray();

　　null/notnull查询

$res = member::whereNull('username')->get()->toArray();

$res = member::whereNotNull('username')->get()->toArray();


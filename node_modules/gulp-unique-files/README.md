gulp-add-src
============

Keep only last file with same filename in stream

Copyright (C) 2015, Aleksandr Kitov <kitov.nn@gmail.com>


Installation
------------

`npm install gulp-unique-files --save-dev`

Usage
-----
If you have following directory structure:

```
common
-lib1.js
-lib2.js
-lib3.js
src
-lib2.js
-lib4.js
```

gulpfile.js

```js
var gulp = require('gulp'),
	concat = require('gulp-concat')
	uniqueFiles = require('gulp-unique-files');

gulp.task('build', function () {
  return gulp.src(['common/**/*.js', 'src/**/*.js'])
  	.pipe(uniqueFiles())
	.pipe(concat('app.js'))
	.pipe(gulp.dest('dist'));
});
```

File `dist/app.js` will containt js from `common/lib1.js`, `src/lib2.js`, `common/lib3.js` and `lib4.js`.

`gulp.src` get files in correct order, but if you will use this plugin with somethong like gulp-addsrc or other plugins that can change original stream you may need to use gulp-order to make this plugin work correctly.

License
----

Released under the terms of MIT License:

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

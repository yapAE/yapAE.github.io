var path = require('path'),
    _ = require('lodash'),
    through = require('through2');

module.exports = function () {
    var files = [];
    return through.obj(function (file, enc, cb) {
        var relative = path.relative(file.base, file.path);
        var findIndex = _.findIndex(files, function (item) {
            return path.relative(item.base, item.path) == relative;
        });
        if (findIndex !== -1) {
            files[findIndex] = file;
        } else {
            files.push(file);
        }
        cb();
    }, function (cb) {
        var that = this;
        files.forEach(function (file) {
            that.push(file);
        });
        cb();
    });
};
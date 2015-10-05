angular.module('app.filters', []).filter('unique', function() {
  return function(arr, key) {
    var obj;
    obj = {};
    if (_.isEmpty(arr)) {
      return false;
    }
    if (key === 'all') {
      return arr;
    }
    arr.forEach(function(item) {
      var str;
      str = item.category[key];
      if (str) {
        obj[str] = true;
      }
    });
    return Object.keys(obj);
  };
}).filter('allKeyfilter', function() {
  return function(obj, arr) {
    var newArr;
    newArr = [];
    if (_.isEmpty(obj)) {
      return false;
    }
    _.forEach(arr, function(item) {
      return newArr.push(_.filter(obj, function(a) {
        return a.type === item;
      }));
    });
    if (_.isEmpty(arr)) {
      newArr = obj;
    }
    return newArr = _.flatten(newArr);
  };
});

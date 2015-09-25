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
    obj.forEach(function(item) {
      _.forEach(item.category, function(item2, i) {
        if (!_.isEmpty(arr)) {
          if (_.intersection(item2, item.category[i])) {
            return newArr = item;
          }
        }
      });
    });
    if (_.isEmpty(arr)) {
      newArr = obj;
    }
    console.log(newArr, obj);
    return newArr;
  };
});

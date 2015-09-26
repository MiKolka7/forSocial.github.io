angular.module('app.filters', [])
.filter('unique', ->
    (arr, key) ->
        obj = {}
        if _.isEmpty(arr)
            return false

        if key == 'all'
            return arr

        arr.forEach (item) ->
            str = item.category[key]
            if str
                obj[str] = true
            return

        Object.keys obj
)
.filter 'allKeyfilter', ->
    (obj, arr) ->
        console.log obj
        return obj
        newArr = []
        if _.isEmpty(obj)
            return false

        obj.forEach (item) ->
            _.forEach(item.category, (item2, i) ->
                if !_.isEmpty(arr)
                    if (_.intersection(item2, item.category[i]))
                        newArr = item
    #                    console.log item2, item.category[i]
            )
            return

        if _.isEmpty(arr)
            newArr = obj

        console.log newArr, obj

        newArr

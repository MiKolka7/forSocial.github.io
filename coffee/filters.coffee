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
        newArr = []

        if _.isEmpty(obj)
            return false

        _.forEach(arr, (item) ->
            newArr.push (
                _.filter(obj, (a) ->
                    a.type is item
                )
            )
        )

        if _.isEmpty(arr)
            newArr = obj

#        console.log newArr

        newArr = _.flatten(newArr)
#        if !newArr.length
#            newArr = obj
#
#        console.log newArr
#        return newArr

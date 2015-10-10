angular.module('app.factory.serializeDate', [])
    .factory '$serializeDate', ->
        (data) ->
            if !_.isEmpty(data)
                _.each data, (item, i) ->
                    for key of item
                        if key.search(/(D|d)ate/g) + 1
                            data[i][key] = new Date(item[key])
                    return
            data

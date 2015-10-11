angular.module('app.controller.upload', [])
.controller 'uploadFileCtrl', ($scope, Upload, $http) ->
    if !$scope.photo
        $scope.photo = []

    $scope.$watch 'files', ->
        $scope.upload $scope.files

    $scope.log = ''

    $scope.deleteImg = (index, name) ->
        if confirm('Delete the image?')
            data = name: name
            $http.get('/api/delete/image', params: data).success((data, status, headers, config) ->
                console.log '\nDeleted img'
                console.log data
                if data
                    $scope.photo.splice index, 1
                return
            ).error (data, status, headers, config) ->
                console.log '\nAnswer deleted img "Error"'
        return

    $scope.upload = (files) ->
        if files
#            i = 0
#            while i < files.length
                file = files

                y = (new Date).getFullYear()
                m = (new Date).getMonth() + 1
                d = (new Date).getDate()
                r = Math.round(Math.random() * 100)
                date = y + '' + m + '' + d

                fileNameArray = file.name.split('.')
                fileType = fileNameArray[fileNameArray.length - 1]
                fileName = ''
                k = 0

                while k < fileNameArray.length - 1
                    fileName += fileNameArray[k]
                    k++

                file.fileName = fileName + '-' + date + '-' + r + '.' + fileType

                Upload.upload(
                    url: 'core/upload-image.php'
                    headers:
                        'Content-Type': file.type
                    method: 'POST'
                    data: file
                    file: file
                )
                .progress((evt) ->
                    progressPercentage = parseInt(100.0 * evt.loaded / evt.total)
                    $scope.log = 'progress: ' + progressPercentage + '% ' + evt.config.file.fileName + '\n' + $scope.log
                )
                .success (data) ->
#                    if !$scope.multipleUpload
                        $scope.photo = file #s[0].fileName
#                    else
#                        $scope.photo.push config.file.fileName
#                    return
#                i++
        return

    return

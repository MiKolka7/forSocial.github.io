angular.module('app.directive.upload', [])
.directive 'uploadFile', (Upload) ->
    restrict: 'E'
    scope: '=url'
    template: '
        <button type="file"
            name="file"
            ng-model="files"
            ngf-multiple=""
            ngf-select=""
            ngf-capture=""
            ngf-accept="\'image/*\'" accept="image/*">
            <img ng-if="url" ng-src="{{url}}" alt=""/>
            <img ng-if="!url" ng-src="images/design/image.png" alt=""/>
        </button>'
    link: ($scope) ->
        #if (!$scope.photo) {
        #    $scope.photo = [];
        #}

        $scope.$watch 'files', () ->
            $scope.url = null
            $scope.upload $scope.files


        $scope.upload = (file) ->
            if file
                Upload.upload(
                    url: 'core/upload-image.php'
                    headers:
                        'Content-Type': file.type
                    method: 'POST'
                    data: file
                    file: file
                ).success( (data) ->
                    $scope.url = data.substr(3, data.length - 1)
                    console.log data.substr(3, data.length - 1)
                ).error ( () ->
                    console.log arguments
                )

        return
var   gulp = require('gulp')
    , sass = require('gulp-sass')
    , csso = require('gulp-csso')
    , concat = require('gulp-concat')
    , notify = require('gulp-notify')
    , uglify = require('gulp-uglify')
    , coffee = require('gulp-coffee')
    , gutil = require('gulp-util')
    , inject = require('gulp-inject')
    , connect = require('gulp-connect')
    , bowerFiles = require('main-bower-files')
    , ngAnnotate = require('gulp-ng-annotate')
    , autoprefixer = require('gulp-autoprefixer')
    , imageminJpegtran = require('imagemin-jpegtran')
    , imageminPngquant = require('imagemin-pngquant')
    , angularFilesort = require('gulp-angular-filesort')
    ;


//server
gulp.task('server', function () {
    connect.server({
        livereload: true
    });
});


//html
gulp.task('html', function () {
    gulp.src(['./index.html', './template/**/*.html'])
        .pipe(connect.reload());
});


gulp.task('inject', function () {
    var js = {
        app: {
            src: './js/**/*.js',
            name: 'app'
        }
    };

    gulp.src('./index.html')
        .pipe(inject(
                gulp.src(bowerFiles(), { base: './bower_components' }, {read: false}),
                {name: 'bower'},
                {relative: true}
            )
        )
        .pipe(inject(
                gulp.src(js.app.src).pipe(angularFilesort()),
                {name: js.app.name},
                {relative: true}
            )
        )
        .pipe(gulp.dest('./'))
        .pipe(connect.reload());
});


//css
gulp.task('css', function () {
    gulp.src('./css/*.css')
        .pipe(connect.reload());
});


//js
gulp.task('js', function () {
    gulp.src('./js/**/*.js')
        .pipe(connect.reload());
});


//coffee
gulp.task('coffee', function () {
    gulp.src('./coffee/**/*.coffee')
        .pipe(
            coffee({bare: true})
            .on('error', gutil.log)
        )
        .pipe(gulp.dest('./js/'));
});


//minify pic
gulp.task('minify-image', function () {
    gulp.src('./image/*')
        .pipe(imageminJpegtran({progressive: true})())
        .pipe(imageminPngquant({quality: '65-80', speed: 4})())
        .pipe(gulp.dest('./public/'));
});


//sass
gulp.task('sass', function () {
    gulp.src('./sass/**/*.sass')
        .pipe(sass().on('error', gutil.log))
        .pipe(gulp.dest('./css/'));
});


//watch
gulp.task('watch', function () {
    gulp.watch('./index.html', ['html']);
    gulp.watch('./template/**/*.html', ['html']);
    gulp.watch('./sass/**/*', ['sass']);
    gulp.watch('./css/**/*', ['css']);
    gulp.watch('./coffee/**/*.coffee', ['coffee']);
});


//minify css
gulp.task('minify-css', function () {
    gulp.src('./css/*.css')
        .pipe(autoprefixer({
            browsers: ['last 38 versions'],
            cascade: false
        }))
        .pipe(csso())
        .pipe(gulp.dest('./css/'));
});


//minify js
gulp.task('minify-js', function () {
    gulp.src('./js/*')
        .pipe(ngAnnotate())
        .pipe(uglify())
        .pipe(concat('app.min.js'))
        .pipe(gulp.dest('./public/js/'))
});


gulp.task('default', ['server', 'build', 'watch']);
gulp.task('build', ['inject', 'sass', 'coffee']);
gulp.task('public', ['build']);

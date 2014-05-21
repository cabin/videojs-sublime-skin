gulp = require('gulp')
base64 = require('gulp-base64')
concat = require('gulp-concat')
csso = require('gulp-csso')
plumber = require('gulp-plumber')
rename = require('gulp-rename')
sass = require('gulp-ruby-sass')


gulp.task('build', ['sass'])

gulp.task 'sass', ->
  gulp.src('src/**/*.sass')
    .pipe(plumber())
    .pipe(sass(loadPath: ['bower_components/bourbon/dist']))
    .pipe(concat('videojs-sublime-skin.css'))
    .pipe(base64())
    .pipe(gulp.dest('dist'))
    .pipe(csso())
    .pipe(rename(extname: '.min.css'))
    .pipe(gulp.dest('dist'))

gulp.task 'watch', ->
  gulp.watch('src/**/*', ['sass'])

gulp.task('default', ['build', 'watch'])

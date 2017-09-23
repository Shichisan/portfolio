gulp = require('gulp')
sass = require('gulp-sass')
coffee = require('gulp-coffee')

gulp.task 'sass', ->
  gulp.src './css/*.scss'
    .pipe(sass(outputStyle: 'expanded'))
    .pipe(gulp.dest('./css/'))
    return

gulp.task 'sass-watch', ['sass'], ->
  watcher = gulp.watch('./css/*.scss', [ 'sass' ])
  watcher.on 'change', (event) ->
  return

gulp.task 'compile-coffee', ->
  gulp.src './js/*.coffee'
    .pipe coffee(outputStyle: 'expanded')
    .pipe gulp.dest('./js/')

gulp.task('default', ['sass-watch', 'compile-coffee'])
srcDir = './app/src'

gulp = require 'gulp'
sass = require 'gulp-sass'
coffee = require 'gulp-coffee'
browserSync = require('browser-sync').create()
gbowerTask = require 'gulp-bower-task'
imagemin = require 'gulp-imagemin'

gulp.task 'compile-bower', ->
  gulp.src './bower.json'
    .pipe gbowerTask()
    .pipe gulp.dest(srcDir + '/bower_components/')

gulp.task 'sass', ->
  gulp.src srcDir + '/css/*.scss'
    .pipe(sass(outputStyle: 'expanded'))
    .pipe(gulp.dest(srcDir + '/css/'))
    return

gulp.task 'sass-watch', ['sass'], ->
  watcher = gulp.watch(srcDir + '/css/*.scss', [ 'sass' ])
  watcher.on 'change', (event) ->
    browserSync.reload()
  return

gulp.task 'compile-coffee', ->
  gulp.src srcDir + '/js/*.coffee'
    .pipe coffee(outputStyle: 'expanded')
    .pipe gulp.dest(srcDir + '/js/')

gulp.task 'coffee-watch', ['coffee'], ->
  watcher = gulp.watch(srcDir + '/js/*.coffee', [ 'coffee' ])
  watcher.on 'change', (event) ->
    browserSync.reload()
  return

gulp.task 'compile-images', ->
  gulp.src srcDir + '/img/*'
    .pipe(imagemin())
    .pipe gulp.dest(srcDir + '/img/')

gulp.task 'browser-sync', ->
  browserSync.init server:
    baseDir: 'app'
    index: 'index.html'
  return

gulp.task 'bs-reload', ->
  browserSync.reload()
  return

gulp.task 'default', ['sass-watch', 'compile-coffee', 'browser-sync', 'compile-bower', 'compile-images'], ->
  gulp.watch 'app/index.html', ['bs-reload']
  return
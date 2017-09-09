gulp = require('gulp')

gulp.task 'hello', ->
  console.log 'Hello gulp'

gulp.task 'default', ['hello']
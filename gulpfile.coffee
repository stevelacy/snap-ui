es = require "ecstatic"
http = require "http"
gulp = require "gulp"
jade = require "gulp-jade"
stylus = require "gulp-stylus"
reload = require "gulp-livereload"
coffee = require "gulp-coffee"

gulp.task "stylus", ->
  gulp.src "./src/**/*.styl"
    .pipe stylus()
    .pipe gulp.dest "./public"
    .pipe reload()

gulp.task "jade", ->
  gulp.src "./src/**/*.jade"
    .pipe jade()
    .pipe gulp.dest "./public"
    .pipe reload()
  gulp.src "./index.jade"
    .pipe jade()
    .pipe gulp.dest "./"
    .pipe reload()

gulp.task "coffee", ->
  gulp.src "./src/**/*.coffee"
    .pipe coffee()
    .pipe gulp.dest "./public"
    .pipe reload()

gulp.task "copy", ->
  gulp.src ["./src/**/*", "!./src/**/*.jade", "!./src/**/*.styl", "!./src/**/*.coffee"]
    .pipe gulp.dest "./public"


gulp.task "server", (done) ->
  port = 5000
  server = http.createServer es root: "./"
  server.listen port, done


gulp.task "watch", ->
  gulp.watch ["./src/**/*.styl"], ["stylus"]
  gulp.watch ["./**/*.jade"], ["jade"]
  gulp.watch ["./src/*", "!./src/*.jade", "!./src/*.styl", "!./src/*.coffee"], ["copy"]

gulp.task "default", ["server", "stylus", "jade", "coffee", "copy", "watch"]
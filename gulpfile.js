'use strict';

// require paths to sass and css directories out of local settings
const settings = require('./gulp.settings');

// require the plugins
var gulp         = require('gulp');
var postcss      = require('gulp-postcss');
var sass         = require('gulp-sass');
var sourcemaps   = require('gulp-sourcemaps');
var autoprefixer = require('gulp-autoprefixer');
var browserSync  = require('browser-sync').create();

// Compile sass into CSS & auto-inject into browsers
gulp.task('sass', function (cb) {
    var processors = [
        autoprefixer
    ];
    //return gulp.src([settings.SASS_SRC + '/bootstrap/bootstrap.scss', settings.SASS_SRC + '/silvercart.scss'])
    return gulp.src([settings.SASS_SRC + '/theme-*.scss'])
            .pipe(sourcemaps.init())
            .pipe(sass().on('error', sass.logError))
            .pipe(autoprefixer())
            .pipe(sourcemaps.identityMap())
            .pipe(sourcemaps.write('.'))
            .pipe(gulp.dest(settings.CSS_DIR + '/'))
            .pipe(browserSync.stream());
    // call the callback to signal that task is finished
    // useful for task sequencing, such as compile css and minify
    cb();
});

// If you only want to watch changes to scss files and don't want to
// use browser-sync, you can use this task by invoking `gulp sass:watch`
gulp.task('sass:watch', function () {
    gulp.watch(settings.SASS_SRC + '/*.scss', ['sass']);
});

// prefix css files with autoprefixer
gulp.task("prefixcss", function (cb) {
    var processors = [
        autoprefixer
    ];
    return gulp.src(settings.CSS_DIR + '/*.css')
            .pipe(autoprefixer())
            .pipe(gulp.dest(settings.CSS_DIR + '/'));
    cb();
});

// task to initialize browser-sync
// Static Server + watching scss/html files
gulp.task('serve', ['sync','sass'], function () {
    // Serve files from the root of this project
    browserSync.init({
        proxy: settings.APP_URL,
        port: 8080,
        open: true,
        notify: false,
        files: [
            // Patterns for static files to watch. 
            // We're watching js and php files within mysite
            // and SilverStripe template files within themes
            "resources/**/*.js"
        ]
    });
    // watch changes to sass (these will also be piped to browser-sync)
    gulp.watch([settings.SASS_SRC + '/*.scss'], ['sass']);
    gulp.watch([settings.CSS_DIR + '/*.css', settings.CSS_DIR + '/*.map'], ['sync']);
});
// sync css and map files to SYNC_PATH on server
gulp.task('sync', function (cb) {
    return gulp.src([settings.CSS_DIR + '/*.css', settings.CSS_DIR + '/*.map'])
            .pipe(gulp.dest(settings.SYNC_PATH + settings.CSS_DIR + '/'))
            .pipe(browserSync.stream());
    cb();
});
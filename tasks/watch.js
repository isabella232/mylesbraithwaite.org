module.exports = function (grunt) {
    'use strict';

    var config = {
        development: {
            files: [
                'source/*',
                'source/**/*',
                '!source/_uploads'
            ],
            tasks: [
                'jekyll:build'
            ],
            options: {
                livereload: true
            }
        },
        staging: {
            files: [
                'source/*',
                'source/**/*'
            ],
            tasks: [
                'jekyll:staging',
                'copy:staging'
            ],
            options: {
                livereload: true
            }
        },
        draft: {
            files: [
                'source/*',
                'source/**/*'
            ],
            tasks: [
                'jekyll:draft',
                'copy:draft'
            ],
            options: {
                livereload: true
            }
        }
    };

    grunt.config.set('watch', config);
};

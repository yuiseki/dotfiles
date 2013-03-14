
var lrSnippet = require('grunt-contrib-livereload/lib/utils').livereloadSnippet;
var mountFolder = function (connect, dir) {
    return connect.static(require('path').resolve(dir));
};

module.exports = function (grunt) {
    require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);
    // file paths
    root = './';

    // config
    grunt.initConfig({
        watch: {
            sass: {
                files: ['<%= root %>/styles/{,*/}*.{scss,sass}'],
                tasks: ['sass']
            },
            livereload: {
                files: [
                    '<%= root %>/*.html',
                    '{.tmp,<%= root %>}/styles/{,*/}*.css',
                    '{.tmp,<%= root %>}/scripts/{,*/}*.js',
                    '<%= root %>/images/{,*/}*.{png,jpg,jpeg,webp}'
                ],
                tasks: ['livereload']
            }
        },
        sass: {
            dist: {                            // Target
              files: {                         // Dictionary of files
                'main.css': 'main.scss',       // 'destination': 'source'
                'widgets.css': 'widgets.scss'
              }
            },
            dev: {                             // Another target
              options: {                       // Target options
                style: 'expanded'
              },
              files: {
                'main.css': 'main.scss',
                'widgets.css': [
                  'button.scss',
                  'tab.scss',
                  'debug.scss'  // Maybe you need one extra file in dev
                ]
              }
            }
        },
        connect: {
            options: {
                port: 9000,
                hostname: 'localhost' // or 0.0.0.0
            },
            livereload: {
                options: {
                    middleware: function (connect) {
                        return [
                            lrSnippet,
                            mountFolder(connect, '.')
                        ];
                    }
                }
            },
        },
        open: {
            server: {
                path: 'http://localhost:<%= connect.options.port %>'
            }
        },

    });
    grunt.renameTask('regarde', 'watch');

    // task
    // watch
    // sass
    // livereload
    //
    grunt.registerTask('default', [
        'sass',
        'livereload-start',
        'connect',
        'watch',
        'open'
    ]);
};

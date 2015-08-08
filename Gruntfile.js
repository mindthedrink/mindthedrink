module.exports = function(grunt) {

    'use strict';

    require('load-grunt-tasks')(grunt);

    grunt.initConfig({

        jshint: {
            options: {
                jshintrc: '.jshintrc',
                reporter: require('jshint-stylish')
            },
            files: [
                'app/assets/javascripts/**/*.js'
            ]
        },

        jscs: {
            options: {
                config: '.jscsrc',
                fix: true,
            },
            files: [
                'app/assets/javascripts/**/*.js',
                '!app/assets/javascripts/application.js',
                '!app/assets/javascripts/modules/templates.js'
            ]
        },

        scsslint: {
            options: {
                config: '.scss-lint.yml'
            },
            lint: [
                'app/assets/stylesheets/**/*.scss'
            ]
        },

        svgstore: {
            options: {
                cleanup: ['fill'],
                svg: {
                    id: 'icons',
                    class: 'icons'
                },
                inheritviewbox: true
            },
            icons: {
                files: {
                    'app/assets/images/icons.svg': 'app/assets/images/icons/**/*.svg'
                }
            }
        },

        modernizr: {
            development: {
                devFile: 'vendor/assets/bower_components/modernizr/modernizr.js',
                outputFile: 'vendor/assets/javascripts/modernizr.js',
                // disable everything but the shiv and css classes
                extra: {
                    addtest: true,
                    shiv: true,
                    cssclasses: true,
                    printshiv: false,
                    load: false,
                    mq: false
                },
                uglify: false,
                // feature tests go here:
                tests: [
                    'svg',
                    'touch',
                    'localstorage',
                    'history',
                    'flexbox'
                ],
                parseFiles: false,
                customTests: [
                    'vendor/assets/javascripts/modernizr.tests.js'
                ]
            }
        },

        handlebars: {
            compile: {
                options: {
                    namespace: 'templates',
                    amd: true,
                    processName: function processName(filePath) {
                        var parts = filePath.split('/');

                        return parts[parts.length - 1].replace('.hbs', '').split('_').map(function(word, index) {
                            if (index === 0) {
                                return word;
                            }

                            return word.charAt(0).toUpperCase() + word.slice(1);
                        }).join('');
                    },
                    processPartialName: function processPartialName(filePath) {
                        var parts = filePath.split('/');

                        return parts[parts.length - 1].substring(1).replace('.hbs', '').split('_').map(function(word, index) {
                            if (index === 0) {
                                return word;
                            }

                            return word.charAt(0).toUpperCase() + word.slice(1);
                        }).join('');
                    },
                },
                files: {
                    'app/assets/javascripts/modules/templates.js': 'app/assets/javascripts/**/*.hbs'
                }
            }
        },

        requirejs: {
            compile: {
                options: {
                    baseUrl: '.',
                    mainConfigFile: 'app/assets/javascripts/require_config.js',
                    name: 'app/assets/javascripts/main',
                    include: ['vendor/assets/bower_components/almond/almond'],
                    // insertRequire: ['app/assets/javascripts/main'],
                    out: 'app/assets/javascripts/application.js',
                    useStrict: true,
                    optimize: 'none',
                    // TODO: enable this when `grunt build` is being run during deployment
                    // this will provide better JavaScript debugging in development
                    // useSourceUrl: true,
                    wrap: true
                }
            }
        },

        watch: {
            js: {
                files: [
                    'app/assets/**/*.{js,json}',
                    '!app/assets/javascripts/application.js',
                    'vendor/assets/**/*.js'
                ],
                tasks: ['js:lint', 'js:build']
            },
            sass: {
                files: [
                    'app/assets/stylesheets/**/*.scss'
                ],
                tasks: ['scss:lint']
            },
            icons: {
                files: ['app/assets/images/icons/**/*.svg'],
                tasks: ['icons']
            },
            handlebars: {
                files: 'app/components/**/*.hbs',
                tasks: ['js:build']
            }
        }

    });

    grunt.registerTask('default', [
        'build',
        'watch'
    ]);

    grunt.registerTask('js:lint', [
        'newer:jshint',
        'newer:jscs'
    ]);

    grunt.registerTask('js:build', [
        'newer:handlebars',
        'requirejs'
    ]);

    grunt.registerTask('scss:lint', [
        'newer:scsslint'
    ]);

    grunt.registerTask('lint', [
        'js:lint',
        'scss:lint'
    ]);

    grunt.registerTask('icons', [
        'newer:svgstore'
    ]);

    grunt.registerTask('build', [
        'lint',
        'js:build',
        'icons',
        'modernizr'
    ]);

};

module.exports = function(grunt){

    require("matchdep").filterDev("grunt-*").forEach(grunt.loadNpmTasks);

    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        htmlhint: {
        build: {
            options: {
                'tagname-lowercase': false,
                'attr-lowercase': false,
                'attr-value-double-quotes': true,
                'id-unique': false,
                'head-script-disabled': true,
                'style-disabled': true
            },
            src: ['*.html', '*.tpl']
        }
    },
    uglify: {
        build: {
            files: {
                'dist/js/libs/jquery.min.js': 'src/js/components/jquery/dist/jquery.min.js',
                'dist/js/libs/mediaelements.js': 'src/js/components/mediaelement/build/mediaelement.min.js',
                'dist/js/libs/audio.min.js': 'assets/js/libs/audio.min.js',
                'dist/js/libs/video.js': 'src/js/components/video.js/dist/video.js',
                'dist/js/libs/modernizr.js': 'src/js/components/modernizr/dist/modernizr-build.js',
                'dist/js/libs/bxslider.js': 'assets/js/libs/jquery.bxslider.min.js',
                'dist/js/libs/article-rating.js': 'assets/js/article-rating.js',
                'dist/js/libs/jquery.jcarousel.min.js': 'assets/js/libs/jquery.jcarousel.min.js',
                'dist/js/base.min.js': 'assets/js/init.js',
                'dist/js/showinfo.js': 'assets/js/libs/jquery.showinfo.custom.js',
                'dist/js/plugins.js': 'assets/js/plugins.js',
                'dist/js/script.js': 'assets/js/script.js',
                'dist/js/libs/selectivizr-min.js' : 'assets/js/libs/selectivizr-min.js' // this is for ie only
            }
        }
    },
    staticinline: {
          main: {
              options: {
                  prefix: '@{',
                  suffix: '}@',
                  vars: {
                      'css_include': '<%= grunt.file.read("dist/css/main.css") %>',
                  }
              },
              files: {
                  '_tpl/_html-head-min.tpl': '_tpl/_html-head.tpl',
                  '_tpl/_html-foot-min.tpl': '_tpl/_html-foot.tpl'
              }
          }
      },
    less: {
        dist: {
          options: {
            style: 'compressed'
          },
            files: {
                'dist/css/main.css': ['assets/css/reset.css',
                                      'assets/css/fonts.css',
                                      'assets/css/handheld.css',
                                      'assets/css/map-info.css',
                                      'assets/css/skin.css',
                                      'assets/css/jquery.bxslider.css',
                                      'assets/less/main.less']
            }
        }
    },
    autoprefixer: {
      no_dest: {
            src: ['dist/css/main.css', 'dist/css/main.css']
        }
      },
    watch: {
      options: {
          livereload: true,
        },
        html: {
          files: ['index.html', '*.tpl', '*/**/*.tpl'],
          tasks: ['htmlhint']
        },
        js: {
            files: ['assets/js/**/*.js'],
            tasks: ['uglify', 'staticinline']
        },
        css: {
            files: ['assets/less/*.less'],
            tasks: ['build']
        }
      },
      copy: {
          dist: {
              files: [{
                  cwd: 'assets/img/',
                  expand: true,
                  dest: 'dist/img/',
                  src: [
                      '**/*'
                  ]
              }]
          }
      },
    });

    grunt.registerTask('default', []);
    grunt.registerTask('build',  ['less', 'autoprefixer', 'staticinline', 'copy']);
};

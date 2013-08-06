# Flask defined static path for css, js & assets
static_path = './static'

module.exports = (grunt) ->

    # Project configuration.
    grunt.initConfig

        # less compiler & live browser reload
        watch:
            browser:
                files: [
                    "#{static_path}/less/**/*.less",
                    "#{static_path}/coffee/**/*.coffee",
                    "./index.html"
                ]
                tasks: ['less:dev','coffee']
                options:
                    livereload: true


        # compile .less to .css using Less
        less:
            dev:
                files: do ->
                    obj = {}
                    obj["#{static_path}/kindling.css"] = 
                        "#{static_path}/less/kindling.less"
                    return obj

        coffee:
            glob_to_multiple:
                expand: true
                flatten: true
                cwd: "#{static_path}/coffee/"
                src: ["*.coffee"]
                dest: "#{static_path}/"
                ext: '.js'

    # register tasks for npm installations 
    # (see package.json for coordinating available tasks)
    grunt.loadNpmTasks 'grunt-contrib-less'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-watch'

    # run this task for live browser refresh and less compiling
    grunt.registerTask 'live-browser', [
        'less:dev'
        'coffee'
        'watch'
    ]

    # default task. this is what will run if you simply run "grunt"
    # any other task will have to be called specifically "grunt [taskname]"
    grunt.registerTask 'default', ['live-browser']

module.exports = function(grunt) {
	// require it at the top and pass in the grunt instance
	require('time-grunt')(grunt);

	// Project configuration
	grunt.initConfig({
		// Import package.json file, we get some info from here
		pkg: grunt.file.readJSON('package.json'),

		// Minify JS into one file
		uglify: {
			options: {
				banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */\n'
			},
			files: {
				src: ['out/js/cssemoticons.min.js', 'out/js/main.js'],
				dest: 'out/js/all.min.js'
			}
		},
		cssmin: {
			options: {
				banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */'
			},
			files: {
				src: ['out/css/reset.css', 'out/css/main.css', 'out/css/highlightjs.css', 'out/css/cssemoticons.css'],
				dest: 'out/css/all.min.css'
			}
		}
	});
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-cssmin');
	grunt.registerTask('default', ['uglify', 'cssmin']);
};

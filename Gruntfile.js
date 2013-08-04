module.exports = function(grunt) {
	// Project configuration.
	grunt.initConfig({
		// Import package.json file, we get some info from here
		pkg: grunt.file.readJSON('package.json'),

		// Minify JS into one file
		uglify: {
			options: {
				banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */\n'
			},
			files: {
				src: ['out/scripts/main.js'],
				dest: 'out/scripts/all.min.js'
			}
		},
		// Minify CSS into one file
		cssmin: {
			options: {
				banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */'
			},
			files: {
				src: ['out/styles/reset.css', 'out/styles/main.css'],
				dest: 'out/styles/all.min.css'
			}
		}
	});
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-cssmin');
	grunt.registerTask('default', ['uglify', 'cssmin']);
};

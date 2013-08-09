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
				src: ['out/scripts/cssemoticons.min.js', 'out/scripts/main.js'],
				dest: 'out/scripts/all.min.js'
			}
		},
		// Parse CSS and add vendor prefixes to rules using values from the Can I Use website
		autoprefixer: {
			files: {
				'out/styles/reset.css': ['out/styles/reset.css'],
				'out/styles/main.css': ['out/styles/main.css'],
				'out/styles/cssemoticons.css': ['out/styles/cssemoticons.css'],
			}
		},
		// Minify CSS into one file
		cssmin: {
			options: {
				banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */'
			},
			files: {
				src: ['out/styles/reset.css', 'out/styles/main.css', 'out/styles/cssemoticons.css'],
				dest: 'out/styles/all.min.css'
			}
		}
	});
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-autoprefixer');
	grunt.loadNpmTasks('grunt-contrib-cssmin');
	grunt.registerTask('default', ['uglify', 'autoprefixer', 'cssmin']);
};

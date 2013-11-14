module.exports = function(grunt) {
	// Project configuration
	grunt.initConfig({
		// Import package.json file, we get some info from here
		pkg: grunt.file.readJSON('package.json'),

		// Minify JS into one file
		uglify: {
			files: {
				src: ['out/js/cssemoticons.min.js', 'out/js/main.js'],
				dest: 'out/js/all.min.js'
			}
		},
		cssmin: {
			files: {
				src: ['out/css/reset.css', 'out/css/main.css', 'out/css/fontello.css', 'out/css/highlightjs.css', 'out/css/cssemoticons.css'],
				dest: 'out/css/all.min.css'
			}
		},
		htmlmin: {
			options: {
				removeComments: true,
				removeCommentsFromCDATA: true,
				removeCDATASectionsFromCDATA: true,
				collapseWhitespace: false,
				collapseBooleanAttributes: true,
				removeAttributeQuotes: false,
				removeRedundantAttributes: true,
				useShortDoctype: true,
				removeEmptyAttributes: false,
				removeOptionalTags: true,
				removeEmptyElements: false,
			},
			files: {
				expand: true,
				cwd: 'out/',
				src: ['*.html', 'posts/*.html'],
				dest: 'out/',
				ext: '.html',
			},
		},
	});
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-cssmin');
	grunt.loadNpmTasks('grunt-contrib-htmlmin');
	grunt.registerTask('default', ['uglify', 'cssmin', 'htmlmin']);
};

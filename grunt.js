module.exports = function(grunt) {
	// Project configuration.
	grunt.initConfig({
		// Lists of files to be minified with UglifyJS.
		min: {
			dist: {
				src: 'out/scripts/main.js',
				dest: 'out/scripts/all.min.js',
			},
		},
		concat: {
			css: {
				files: {
					src: ['out/styles/normalize.css', 'out/styles/main.css', 'out/styles/highlightjs.css'],
					dest: 'out/styles/all.min.css',
				},
			},
		},
	});
};

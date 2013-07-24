module.exports = function(grunt) {
	// Project configuration.
	grunt.initConfig({
		// Lists of files to be minified with UglifyJS.
		min: {
			dist: {
				src: 'out/scripts/main.js',
				dest: 'out/scripts/all.min.js'
			}
		}
	});
};

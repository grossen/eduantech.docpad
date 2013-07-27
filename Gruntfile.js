module.exports = function(grunt) {
	// Project configuration.
	grunt.initConfig({
		// Lists of files to be minified with UglifyJS.
		uglify: {
			files: {
				src: ['out/scripts/main.js'],
				dest: 'out/scripts/all.min.js'
			}
		},
		mincss: {
			files: {
				src: ['out/styles/normalize.css', 'out/styles/main.css', 'out/styles/highlightjs.css'],
				dest: 'out/styles/all.min.css'
			}
		}
	});
	grunt.loadNpmTasks('grunt-contrib-mincss', 'grunt-contrib-uglify');
};

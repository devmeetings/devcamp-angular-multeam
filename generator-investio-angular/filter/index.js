'use strict';
var touch = require("touch");
var path = require('path');
var yeoman = require('yeoman-generator');

module.exports = yeoman.generators.NamedBase.extend({
    init: function () {
        console.log('Creating the filter: ' + this.name);
    },

    askFor: function () {
        var done = this.async();

        var prompts = [	
            {
                name: 'rootFolder',
                message: 'Where do you want to place this filter?',
                default: 'common/filters'
            }
        ];

        this.prompt(prompts, function (props) {
            this.rootFolder = props.rootFolder;
            done();
        }.bind(this));
    },
    
    files: function () {
        this.projectName = this.config.get('projectName');
        this.filtersVarName = this.config.get('filtersVarName');
        this.filtersModuleName = this.config.get('filtersModuleName');
        
        this.camelizedName = this._.camelize(this.name);
        var modulePath = path.join('src', this.rootFolder, this.camelizedName);
        this.mkdir(modulePath);
        
        this.template('_filter.coffee', path.join(modulePath, this.camelizedName + '.coffee'));
        this.template('_filterSpec.coffee', path.join(modulePath, this.camelizedName + '.spec.coffee'));
    },
    
    touchIndexHtml: function() {
        // Touch the index.html file to force the index grunt task to rebuild it (that task adds the new module to the scripts)
        var indexHtmlFilePath = 'src/index.html';
        touch(indexHtmlFilePath, {mtime: true});
    }
});
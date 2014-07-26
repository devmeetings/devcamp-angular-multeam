'use strict';
var touch = require("touch");
var path = require('path');
var yeoman = require('yeoman-generator');

module.exports = yeoman.generators.NamedBase.extend({
    init: function () {
        console.log('Creating the directive: ' + this.name);
    },

    askFor: function () {
        var done = this.async();

        var prompts = [	
            {
                name: 'rootFolder',
                message: 'Where do you want to place this directive?',
                default: 'common/directives'
            }
        ];

        this.prompt(prompts, function (props) {
            this.rootFolder = props.rootFolder;
            done();
        }.bind(this));
    },
    
    files: function () {
        this.projectName = this.config.get('projectName');
        this.directivesVarName = this.config.get('directivesVarName');
        this.directivesModuleName = this.config.get('directivesModuleName');
        
        this.camelizedName = this._.camelize(this.name);
        var modulePath = path.join('src', this.rootFolder, this.name);
        this.mkdir(modulePath);
        
        this.template('_directive.coffee', path.join(modulePath, this.name + '.coffee'));
        this.template('_directiveSpec.coffee', path.join(modulePath, this.name + '.spec.coffee'));
        this.template('_directive.less', path.join(modulePath, this.name + '.less'));
        this.template('_directive.tpl.html', path.join(modulePath, this.name + '.tpl.html'));
        
        this._addToImportsLess();
    },
    
    touchIndexHtml: function() {
        // Touch the index.html file to force the index grunt task to rebuild it (that task adds the new module to the scripts)
        var indexHtmlFilePath = 'src/index.html';
        touch(indexHtmlFilePath, {mtime: true});
    },
    
    _addToImportsLess: function app() {
        var hook   = '/* directives imports */',
            path   = 'src/less/imports.less',
            insert = "\n@import '../" + this.rootFolder + "/" + this.name + "/" + this.name + ".less';";

        var file   = this.readFileAsString(path);

        if (file.indexOf(insert) === -1) {
            this.write(path, file.replace(hook, hook + insert));
        }
    }
});
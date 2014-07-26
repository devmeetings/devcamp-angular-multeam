'use strict';
var touch = require("touch");
var path = require('path');
var yeoman = require('yeoman-generator');

module.exports = yeoman.generators.NamedBase.extend({
    init: function () {
        console.log('Creating the module: ' + this.name);
    },

    askFor: function () {
        var done = this.async();

        var prompts = [	
            {
                name: 'rootFolder',
                message: 'Where do you want to place this module?',
                default: 'app'
            }
        ];

        this.prompt(prompts, function (props) {
            this.rootFolder = props.rootFolder;
            done();
        }.bind(this));
    },
    
    files: function () {
        this.projectName = this.config.get('projectName');
        this.projectModuleName = this.config.get('projectModuleName');
        
        this.directivesModuleName = this.config.get('directivesModuleName');
        this.filtersModuleName = this.config.get('filtersModuleName');
        this.servicesModuleName = this.config.get('servicesModuleName');
        
        this.camelizedName = this._.camelize(this.name);
        this.capitalizedName = this._.capitalize(this.camelizedName);
        var modulePath = path.join('src', this.rootFolder, this.name);
        this.mkdir(modulePath);
        
		this.template('_module.coffee', path.join(modulePath, this.name + '.coffee'));
        this.template('_moduleSpec.coffee', path.join(modulePath, this.name + '.spec.coffee'));
        this.template('_module.less', path.join(modulePath, this.name + '.less'));
        this.template('_module.tpl.html', path.join(modulePath, this.name + '.tpl.html'));
        
		this._addToImportsLess();
		this._addModuleToAppJs();
		this._addToUrlPatterns();
    },
    
    touchIndexHtml: function() {
        // Touch the index.html file to force the index grunt task to rebuild it (that task adds the new module to the scripts)
        var indexHtmlFilePath = 'src/index.html';
        touch(indexHtmlFilePath, {mtime: true});
    },
    
    _addToImportsLess: function app() {
        var hook   = '/* app imports */',
            path   = 'src/less/imports.less',
            insert = "\n@import '../" + this.rootFolder + "/" + this.name + "/" + this.name + ".less';";

        var file   = this.readFileAsString(path);

        if (file.indexOf(insert) === -1) {
            this.write(path, file.replace(hook, hook + insert));
        }
    },
    
    _addModuleToAppJs: function app() {
        var hook   = '# App modules',
            path   = 'src/app/app.coffee',
            insert = "\n  '" + this.projectModuleName + "." + this.name + "'";

        var file   = this.readFileAsString(path);

        if (file.indexOf(insert) === -1) {
            this.write(path, file.replace(hook, hook + insert));
        }
    },
    
    _addToUrlPatterns: function app() {
        var hook   = 'fe: {',
            path   = 'src/common/services/urlPatterns/urlPatterns.coffee',
            insert = "\n    " + this.camelizedName + ": '" + this.name + "'";

        var file   = this.readFileAsString(path);

        if (file.indexOf(insert) === -1) {
            this.write(path, file.replace(hook, hook + insert));
        }
    }
});
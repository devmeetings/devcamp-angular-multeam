'use strict';
var touch = require("touch");
var path = require('path');
var yeoman = require('yeoman-generator');

module.exports = yeoman.generators.NamedBase.extend({
    init: function () {
        console.log('Creating the service: ' + this.name);
    },

    askFor: function () {
        var done = this.async();

        var prompts = [	
            {
                name: 'rootFolder',
                message: 'Where do you want to place this service?',
                default: 'common/services'
            },
            {
                name: 'serviceType',
                message: 'What kind of service you would like to create (provider/factory/constant)?',
                default: 'factory'
            }
        ];

        this.prompt(prompts, function (props) {
            this.rootFolder = props.rootFolder;
            this.serviceType = props.serviceType;
            
            if(
            	this.serviceType != 'provider' &&
            	this.serviceType != 'factory' &&
            	this.serviceType != 'constant'
            ){
            	throw 'Unknown service type: ' + this.serviceType;
            }
            
            done();
        }.bind(this));
    },
    
    files: function () {
        this.projectName = this.config.get('projectName');
        this.servicesVarName = this.config.get('servicesVarName');
        this.servicesModuleName = this.config.get('servicesModuleName');
        
        this.camelizedName = this._.camelize(this.name);
        var modulePath = path.join('src', this.rootFolder, this.camelizedName);
        this.mkdir(modulePath);
        
        this.template('_' + this.serviceType + '.coffee', path.join(modulePath, this.camelizedName + '.coffee'));
        this.template('_serviceSpec.coffee', path.join(modulePath, this.camelizedName + '.spec.coffee'));
    },
    
    touchIndexHtml: function() {
        // Touch the index.html file to force the index grunt task to rebuild it (that task adds the new module to the scripts)
        var indexHtmlFilePath = 'src/index.html';
        touch(indexHtmlFilePath, {mtime: true});
    }
});
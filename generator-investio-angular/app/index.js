'use strict';
var yeoman = require('yeoman-generator');

module.exports = yeoman.generators.Base.extend({
	_prompts: [],
	
    askFor: function () {
        var done = this.async();

        // have Yeoman greet the user
        this.log(this.yeoman);

        this.log('You\'re creating a ultra beautiful investio angular App.');

        var prompts = [
            {
                name: 'projectName',
                message: 'What is the name of the project?\n',
                default: 'Investio Accounts'
            },
            {
                name: 'projectModuleName',
                message: 'How do you want to name your project module?\n',
                default: 'investio-accounts'
            },
            {
                name: 'projectVarName',
                message: 'How do you want to name your project variable?\n',
                default: 'investioAccounts'
            },
            {
                name: 'filtersModuleName',
                message: 'How do you want to name your filter module?\n',
                default: 'investio-accounts-filters'
            },
            {
                name: 'filtersVarName',
                message: 'How do you want to name your filter variable?\n',
                default: 'investioAccountsFilters'
            },
            {
                name: 'directivesModuleName',
                message: 'How do you want to name your directive module?\n',
                default: 'investio-accounts-directives'
            },
            {
                name: 'directivesVarName',
                message: 'How do you want to name your directive variable?\n',
                default: 'investioAccountsDirectives'
            },
            {
                name: 'servicesModuleName',
                message: 'How do you want to name your service module?\n',
                default: 'investio-accounts-services'
            },
            {
                name: 'servicesVarName',
                message: 'How do you want to name your service variable?\n',
                default: 'investioAccountsServices'
            }
        ];

		this._prompts = prompts;

        this.prompt(prompts, function (props) {
        	for(var key in prompts){
        		this[prompts[key].name] = props[prompts[key].name];
        	}

            done();
        }.bind(this));
    },

    config: function() {
    	for(var key in this._prompts){
    		this.config.set(this._prompts[key].name, this[this._prompts[key].name]);
    	}
        
        this.config.save();
    }
});
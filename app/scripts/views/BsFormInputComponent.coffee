###**
{{bs-form-input
	type="text|password|datetime|datetime-local|date|month|time|week|number|email|url|search|tel|color"|isText="true|false"|isPassword="treu|false"|...
	value="Some value"
}}
###
Bootstrap.BsFormInputComponent = SELF = Ember.TextField.extend Bootstrap.BsFormControlComponentMixin, 
	type: 'text'
	# getter and setter for isText, isPassword, ... are set after the class declaration



SELF.reopenClass
	validInputTypes: 'text password datetime datetime-local date month time week number email url search tel color'.split /\s/g

# now we add all the isText, isPassword, isDatetime, ... helpers (setters and getters)
mixin = {}
for inputType in SELF.validInputTypes
	prop = Ember.String.camelize inputType
	mixin["is#{Ember.String.capitalize prop}"] = Bootstrap.createBoundSwitchAccessor inputType, 'type', 'text'
SELF.reopen mixin

# Since we're extending TextField we need to register ourself
Ember.Handlebars.registerHelper 'bs-form-input', Bootstrap.BsFormInputComponent

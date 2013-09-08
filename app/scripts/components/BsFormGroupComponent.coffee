###**
{{bs-form-group
	type="input|textarea|select|radio|checkbox"|isInput="true|false"|isCheckbox="true|false"|isRadio="true|false"|...
	label="Some Label"
	yieldInsideLabel="true|false"
	status="none|error|warning|success"|hasError="true|false"|hasWarning"true|false"|hasSuccess="true|false"
	controlType=""
	controlName=""
	controlValue=""
}}
###
Bootstrap.BsFormGroupComponent = Ember.Component.extend
	classNamesBinding: [
		'isInput:form-group:', 'isSelect:form-group:', 'isTextarea:form-group:',
		'isRadio:radio:', 'isCheckbox:checkbox:',
		'hasError', 'hasWarning', 'hasSuccess']
	# the type is saved in this property and isXxx getter and setters are bound to it so that
	# setting one unset others etc...
	type: null
	isInput: Bootstrap.createBoundSwitchAccessor 'input', 'type', 'input'
	isSelect: Bootstrap.createBoundSwitchAccessor 'select', 'type', 'input'
	isTextarea: Bootstrap.createBoundSwitchAccessor 'textarea', 'type', 'input'
	isRadio: Bootstrap.createBoundSwitchAccessor 'radio', 'type', 'input'
	isCheckbox: Bootstrap.createBoundSwitchAccessor 'checkbox', 'type', 'input'
	# label (setting to null or empty string will generate it but without text, same for the help text)
	label: no
	# help text under the field
	helpText: no
	# should yield be inside the label?
	yieldInsideLabel: null
	# has(Error|Success|Warning)
	status: 'none'
	hasError: Bootstrap.createBoundSwitchAccessor 'error', 'status', 'none'
	hasWarning: Bootstrap.createBoundSwitchAccessor 'warning', 'status', 'none'
	hasSuccess: Bootstrap.createBoundSwitchAccessor 'success', 'status', 'none'
	# control related
	controlType: no
	controlName: null
	controlValue: null

	# read-only
	hasLabel: (() ->
		@get('label') isnt no
	).property('label').readOnly()
	# have some help text?
	hasHelpText: (() ->
		@get('helpText') isnt no
	).property('helpText').readOnly()
	# should we create the control?
	hasControl: (() ->
		not Ember.isEmpty @get('controlType')
	).property('controlType').readOnly()
	# used to define type based on the controlType if it's not set
	controlTypeObserver: (() ->
		return unless (type = @get 'controlType')
		@set 'type', type.replace(/\..*$/g, '')
	).observes 'controlType'

	# initialize
	init: ->
		@controlTypeObserver() unless @get('type')


	# private
	# do we have to add yieldInside the label if there is a label defined?
	_isYieldInsideLabel: (->
		if @get('hasLabel') and (forced = @get 'yieldInsideLabel') isnt null
			!!forced
		else
			@get('type') in ['radio', 'checkbox']
	).property('type', 'yieldInsideLabel', 'hasLabel').readOnly()
	# do we have to add {{yield}} outside of the label?
	_hasYield: (->
		not (@get('hasLabel') and @get('_isYieldInsideLabel'))
	).property('_isYieldInsideLabel', 'hasLabel').readOnly



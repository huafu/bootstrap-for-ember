
###**
{{bs-form-label
	text="Some label"
	yieldAfterText="true|false"
	controlName="relatedControlName"
}}
###
Bootstrap.BsFormLabelComponent = Ember.Component.extend
	tagName: 'label'
	classNames: ['control-label']
	attributeBindings: ['for']
	yieldAfterText: no
	text: null
	for: null
	controlName: null

	didInsertElement: ->
		# TODO: is this the right moment to call?
		return unless (name = @get 'controlName') and
				not @get('for') and
				(id = @$().closest(":input[name=\"#{name}\"]").attr('id'))
		@set 'for', id


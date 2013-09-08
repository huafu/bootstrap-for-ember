###**
{{bs-form
	layout="default|inline|horizontal"|isDefaultLayout="true|false"|isInline="true|false"|isHorizontal="true|false"
}}
###
Bootstrap.BsFormComponent = Ember.Component.extend
	tagName: 'form'
	classNamesBinding: ['isDefaultLayout:form:', 'isInline:form-inline:', 'isHorizontal:form-horizontal:']
	attributesBinding: ['role', 'name']
	role: 'form'
	name: null
	# the layout is saved in this property and isXxx getter and setters are bound to it so that
	# setting one unset others etc...
	layout: 'default'
	isDefaultLayout: Bootstrap.createBoundSwitchAccessor 'default', 'layout'
	isInline: Bootstrap.createBoundSwitchAccessor 'inline', 'layout'
	isHorizontal: Bootstrap.createBoundSwitchAccessor 'horizontal', 'layout'
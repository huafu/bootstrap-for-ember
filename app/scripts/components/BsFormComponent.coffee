###**
{{bs-form
	formLayout="default|inline|horizontal"|isDefaultLayout="true|false"|isInline="true|false"|isHorizontal="true|false"
}}
###
Bootstrap.BsFormComponent = Ember.Component.extend
	tagName: 'form'
	classNamesBinding: ['formLayout']
	attributesBinding: ['role', 'name']
	role: 'form'
	name: null
	# the layout is saved in this property and isXxx getter and setters are bound to it so that
	# setting one unset others etc...
	formLayout: 'form'
	isLayoutDefault: Bootstrap.createBoundSwitchAccessor 'form', 'formLayout', 'form'
	isLayoutInline: Bootstrap.createBoundSwitchAccessor 'form-inline', 'formLayout', 'form'
	isLayoutHorizontal: Bootstrap.createBoundSwitchAccessor 'form-horizontal', 'formLayout', 'form'
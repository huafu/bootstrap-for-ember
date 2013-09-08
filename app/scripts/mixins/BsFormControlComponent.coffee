###**
Mixin for all controls
###
Bootstrap.BsFormControlComponent = Ember.Mixin.create Bootstrap.SizeSupport,
	classNames: ['form-control']
	# for Bootstrap.SizeSupport mixin
	classTypePrefix: 'input'
	value: null
	hasValue: (->
		@get('value') isnt null
	).property('value').readOnly()
	placeholder: null
	isDisabled: ((key, value) ->
		if arguments.length is 2
			@set '_disabled', !!value
		@get '_disabled'
	).property('_disabled')
	isEnabled: ((key, value) ->
		if arguments.length is 2
			@set '_disabled', not value
		not @get '_disabled'
	).property('_disabled')


	# private
	_disabled: no


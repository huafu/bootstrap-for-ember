Bootstrap = window.Bootstrap = Ember.Namespace.create()

# Helper to create boolean accessors
Bootstrap.createBoundSwitchAccessor = (switchValue, myProperty, myDefault = 'default') ->
  ((key, value) ->
    if arguments.length is 2
      @set myProperty, (if value then switchValue else myDefault)
    @get(myProperty) is switchValue
  ).property(myProperty)

# add radio buttons to ember if it's not implemented in the version used
unless Ember.RadioButton
  Ember.RadioButton = Ember.View.extend
      tagName: 'input'
      type: 'radio'
      attributeBindings: ['name', 'type', 'value', 'checked:checked:'],
      click: ->
          this.set 'selectedValue', @$().val()
          # be sure to not bubble the event
          no

      checked: (() ->
          @get('value') is @get('selectedValue')
      ).property('selectedValue', 'value')

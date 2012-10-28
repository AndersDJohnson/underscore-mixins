_ = require 'underscore'

do (root = this) ->
	
	__ = {}
	
	# Return the value of the input (identity), or its result if input is a function.
	__.yields = (input) ->
			return (if _.isFunction(input) then input() else input)
	
	if module?.exports?
		module.exports = __.yields
	
	else if root._?
		root._.mixin __
	
	else
		root._ = __
	

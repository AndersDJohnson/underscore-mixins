_ = require 'underscore'

do (root = this) ->
	
	__ = {}
	
	__.concat = (obj, context) ->
			return _.reduce(obj, ((item, memo) ->
				_.each(item, (subitem) -> memo.push(subitem))
				return memo
			), [], context)
	
	if module?.exports?
		module.exports = __.concat
	
	else if root._?
		root._.mixin __
	
	else
		root._ = __
	

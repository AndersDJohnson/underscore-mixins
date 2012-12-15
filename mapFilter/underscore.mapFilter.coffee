_ = require 'underscore'

do (root = this) ->
	
	__ = {}
	
	__.mapFilter = do ->
		# Construct unique "skip" object for skip test.
		skip = {}
		(list, iterator, memo, context) ->
			results = []
			_.each(list, ((value, index, list) ->
				result = iterator.call(context, skip, value, index, list)
				results.push(result) unless result is skip
			), context)
			return results
	
	if module?.exports?
		module.exports = __.mapFilter
	
	else if root._?
		root._.mixin __
	
	else
		root._ = __


###
# An earlier implementation - slower but doesn't depend on === object identity.
mapFilter = do ->
	(list, iterator, memo, context) ->
		results = []
		_.each(list, ((value, index, list) ->
			skip = false
			result = iterator.call(context, (->
				skip = true
				return
			), value, index, list)
			results.push(result) unless skip
		), context)
		return results
###


###
# A test case / example, should return [3, 9]
m = mapFilter([1,2,3,4], (skip, value) ->
	if value is 2 or value is 4
		return skip
	return value*3
)
console.log(m)
###


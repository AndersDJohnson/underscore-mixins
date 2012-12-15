_ = require 'underscore'

do (root = this) ->
	
	__ = {}
	
	__.mapObject = (obj, iterator, context) ->
		results = {}
		return results if obj == null
		if _.isArray(obj)
			return _.map(obj, iterator, context)
		_.each(obj, ((value, key, obj) ->
			results[key] = iterator.call(context, value, key, obj)
		))
		return results
	
	__.collectObject = __.mapObject
	
	if module?.exports?
		module.exports = __.mapObject
	
	else if root._?
		root._.mixin __
	
	else
		root._ = __

###
# test case / example, should return {a:18,b:20}
m = _.mapObject({a:9,b:10}, ((i) -> i*2))
console.log(m)

# test case / example, should return [6, 12]
m = _.mapObject([3,6], ((i) -> i*2))
console.log(m)
###


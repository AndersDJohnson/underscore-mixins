_ = require 'underscore'

do (root = this) ->
	
	__ = {}
	
	__.filterObject = (obj, iterator, context) ->
		results = {}
		return results if obj == null
		if _.isArray(obj)
			return _.filter(obj, iterator, context)
		_.each(obj, ((value, key, obj) ->
			result = iterator.call(context, value, key, obj)
			results[key] = value if result
		))
		return results
	
	__.selectObject = __.filterObject
	
	if module?.exports?
		module.exports = __.filterObject
	
	else if root._?
		root._.mixin __
	
	else
		root._ = __

# test case / example, should return {a:9}
m = _.filterObject({a:9,b:10}, ((v, k) -> return k is 'a'))
console.log(m)

# test case / example, should return [6]
m = _.filterObject([3,6], ((v, k) -> return i isnt 3))
console.log(m)


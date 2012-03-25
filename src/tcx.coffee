fs    = require 'fs'
DomJS = (require 'dom-js').DomJS

fromFile = (filename, callback) ->
	fs.readFile filename, 'utf8', (error, data) ->
			if error then callback error, data else fromString data, callback

fromString = (string, callback) ->
	dj = new DomJS()
	dj.parse string, (error, dom) ->
			callback error, (if error then dom else new tcxParser dom)

tcxParser = (json_dom) -> 
	@activities = []
	for item in json_dom.children
		if item.name is "Activities"
			@activities = (tcxActivityParser activity for activity in item.children when activity.name is "Activity")
	return @activites
	
tcxActivityParser = (activity_dom) -> 
	rv = {}
	rv.sport = activity_dom.attributes?.Sport
	
	for entry in activity_dom.children
		rv.startTime = entry.children[0]?.text if entry.name is "Id"
	
	return rv

exports.fromFile = fromFile
exports.fromString = fromString
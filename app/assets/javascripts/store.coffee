Redux = require 'redux'

reducer = (state=0, action=null) ->
	switch action.type
		when 'INCREMENT' then return state+1
		when 'DECREMENT' then return state-1
	state

module.exports = Redux.createStore reducer

# Project dependencies
Utils = require './utils.coffee'

###
# ParseLessError (extends Error)
# @param err
#   an error object value from less.render callback.
###
ParseLessError = (err) ->  
  this.name = 'ParseLessError'
  this.message =  "#{err.message} near (file #{err.filename}, line #{err.line})\n"
  if err.extract
    this.message += Utils.valueToMarkdown err.extract

ParseLessError.prototype = Error.prototype

### End of module ###

module.exports = ParseLessError
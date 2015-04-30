# Core dependencies
fs = require 'fs'
log = require 'loglevel'
path = require 'path'
less = require 'less'
coffee = require 'coffee-script'

# Project dependencies
ParseLessError = require './errors/parse-less-error.coffee'
CliUtils = require './cli-utils.coffee'

###
# Returns configuration for Less.
# @param context
#   the command-line utility context
# @returns {object}
###
lessConfig = (context) ->
  lessDirectory = context.dirs.less
  inputFiles = {}
  inputFiles["assets/css/main.css"] = "main.less"
  ret = 
    development:
      options:
        paths: [lessDirectory]
        syncImport: true
        compress: false
      files: inputFiles
    production:
      options:
        paths: [lessDirectory]
        syncImport: true
        compress: true
      files: inputFiles
  return ret

###
# Parses all .less files and outputs the .css
# files in target assets directory.
# @param context
#   the command-line utility context
###
parseLess = (context) -> 
  config = lessConfig(context).development
  for cssFile, lessFile of config.files
    lessContents = fs.readFileSync("#{context.dirs.less}/#{lessFile}", 'utf8')
    less.render lessContents, config.options, (err, output) ->
      CliUtils.exitWithError(new ParseLessError(err), 'failed rendering less file') if err
      try
        fs.writeFileSync("#{context.dirs.target}/#{cssFile}", output.css)
      catch err
        CliUtils.exitWithError(err, 'failed to save css file')
    log.warn("rendered #{lessFile} to #{cssFile}")


parseSoy = (context) ->
  # TODO: parse soy files

### End of module ###

module.exports =
  parseLess: parseLess
  parseSoy: parseSoy
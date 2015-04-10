# Project dependencies
FileUtils = require './file-utils.coffee'

module.exports =
  ###
  # Creates target directories.
  # @param context {object}
  #   context of the command-line utility.
  ###
  clear: (context) ->
    FileUtils.clearDirectory(context.dirs.target)

  ###
  # Creates directories for the target.
  # @param context {object}
  #   context of the command-line utility.
  ###
  createDirs: (context) ->
    dirs = [
      'assets'
      'assets/css'
      'assets/js'
    ]
    targetDir = context.dirs.target
    dirs = dirs.map (name) ->
      targetDir.concat('/' + name)
    dirs.forEach (dir) ->
      FileUtils.makeDirectory dir
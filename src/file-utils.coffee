# Core dependencies
fs = require 'fs'

###
# Deletes contents of the directory.  
# @param directory {string}
#   full path to directory to be emptied.
# @notes
#   preserves the directory.
###
clearDirectory = (directory) ->
  files = fs.readdirSync(directory)
  
  # Expand files to list full file path
  files = files.map (name) ->
    directory.concat('/' + name)

  files.forEach (name) ->
    stat = fs.lstatSync(name)
    if stat.isDirectory()
      clearDirectory(name)
      fs.rmdirSync(name)
    else
      fs.unlinkSync(name)

###
# Creates a new empty directory.
# @param directory {string}
#   full path including name of directory to be created.
###
makeDirectory = (directory) ->
  fs.mkdirSync(directory)

### End of module ###

module.exports =
  clearDirectory: clearDirectory
  makeDirectory: makeDirectory
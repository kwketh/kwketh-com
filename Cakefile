# Require dependencies
CoffeeScript = require 'coffee-script'
TargetRenderer = require './src/target-renderer.coffee'
TargetUtils = require './src/target-utils.coffee'

dirs = 
  src: __dirname + '/src'
  target: __dirname + '/target'

context = 
  dirs: dirs

clearTarget = () ->
  TargetUtils.clear(context)

buildTarget = () ->
  TargetUtils.clear(context)
  TargetUtils.createDirs(context)
  # TODO: parse less, render soy templates, ...

task 'clear', 'clears the target', clearTarget
task 'build', 'builds the website as static target', buildTarget

# Sublime build
task 'sbuild', 'builds the website as static target', buildTarget

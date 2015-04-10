###
# Prints the error object mesage to `stderr` and 
# terminates the process right after.
#
# @param err {Error.prototype}
#   error object to print.
#
# @notes
#   this method is particuraly useful to guarantee
#   command-line utility termination. throwing
#   the error via `throw` keyword is not a solution
#   as it may be catched and therefore the utility
#   will continue execution unexpectedly.
### 
exitWithError = (err, info) ->
  if info
    process.stderr.write("error: #{info}\n\n#{err.message}\n")
  else
    process.stderr.write("error: #{err.message}\n")
  process.exit()    

### End of module ###

module.exports = 
  exitWithError: exitWithError
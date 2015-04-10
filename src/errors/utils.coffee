###
# Returns a markdown-friendly representation
# of any value type.
# @returns {string}
###
valueToMarkdown = (value, wrap = true) ->
  text = "<<<\n" if wrap
  if typeof value is 'number'
    text = value
  else if typeof value is 'string' and value.length > 0
    text = value
  else if Array.isArray value    
    value = value.filter (innerValue) ->
      valueToMarkdown(innerValue, false).length > 0
    value = value.map (innerValue) ->
      valueToMarkdown(innerValue, false)
    text += "#{value.join('\n')}"
  text += "\n>>>" if wrap
  return text or ""

### End of module ###

module.exports =
  valueToMarkdown: valueToMarkdown
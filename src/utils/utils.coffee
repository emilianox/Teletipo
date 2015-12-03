mergeObj = (newObj,oldObj) ->
  for key, value of newObj
    if typeof value is 'object'
      if oldObj[key]?
        for subkey, subvalue of value
          oldObj[key][subkey] = subvalue
      else
        oldObj[key] = value
    else
      oldObj[key] = value

extend = (obj) ->
  Array::slice.call(arguments_, 1).forEach (source) ->
    if source
      for prop of source
        if source[prop].constructor is Object
          if not obj[prop] or obj[prop].constructor is Object
            obj[prop] = obj[prop] or {}
            extend obj[prop], source[prop]
          else
            obj[prop] = source[prop]
        else
          obj[prop] = source[prop]

  obj

setGlobalVariable = (varname,value)->
  PropertiesService.getScriptProperties().setProperty(varname, JSON.stringify(value))

getGlobalVariable = (varname)->
  JSON.parse(PropertiesService.getScriptProperties().getProperty(varname))

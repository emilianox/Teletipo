logEvent = (objToSend) ->
  time = Utilities.formatDate(new Date(), "GMT-03", "dd/MM/yyyy HH:mm")
  toLog = getGlobalVariable("toLog")
  info = JSON.parse(toLog)
  name = if info.message.from.first_name? then info.message.from.first_name else "unknow"
  last_name = if info.message.from.first_name? then info.message.from.last_name  else "unknow"
  command = info.message.text

  rowsToLog = [time,
                name,
                last_name,
                command,
                toLog,
                JSON.stringify(objToSend)]

  saveLogInSpreadsheet(CONSTANTS.logSheet,"all",rowsToLog)

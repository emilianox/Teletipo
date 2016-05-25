###*
 * doPost is the method for recieving info for external sources
 * in this proyect is used for receive the telegram data and process
 * @param  {object} e google apps events
 * @return {null}
###
doPost = (e) ->
  #default values
  rawData = e.postData.contents  if typeof e isnt "undefined"
  if not e.postData.contents?
    rawData = JSON.stringify(
      message:
        text: "Warning - Not Send by telegram"
        chat:
          id: CONSTANTS.supervacaID
    )

  ##log
  setGlobalVariable('toLog', rawData)

  processPost(rawData)


###*
 * identify is next function and exectute action
 * @param  {[type]} rawData    [description]
 * @return {[type]}            [description]
###
processPost = (rawData) ->
  parsedData = JSON.parse(rawData)
  user = parsedData.message.chat.username
  #check if is the next function(esta haciendo una pregunta)
  # "/" mean a command
  if (getGlobalVariable("session")?[user]?.nextFn?) and (parsedData.message.text[0] isnt "/")
    nextFn parsedData
  else
    command = parsedData.message.text
    chat_id = parsedData.message.chat.id
    #if test command
    #"commmandInfo is a command witch send info about the message"
    if command is CONSTANTS.commmandInfo
      telegramPost chat_id, rawData
    else
      telegramPost chat_id, execCommand(command,{user: user,allData:parsedData})


getKeyboard = ->
  if getGlobalVariable('keyboard')?
    setGlobalVariable('keyboard', CONSTANTS.keyboard)
    # async patch
    return getGlobalVariable('keyboard')
  else
    return getGlobalVariable('keyboard')

###*
 * send data to telegram
 * @param  {string} chat_id           chat telegram id to send
 * @param  {string} text              text to send
 * @param  {[type]} otheroptions=null [description]
 * @return {[type]}                   [description]
###
telegramPost = (chat_id, text,otheroptions=null) ->
  if !text?
    return false
  keyboard = getKeyboard()

  objToSend =
    text: text
    chat_id: chat_id
    reply_markup:
      reply_keyboard: keyboard
      resize_keyboard: false

  #add otheroptions
  if otheroptions?
    mergeObj(otheroptions,objToSend)

  #fix for work
  objToSend["reply_markup"] = JSON.stringify(objToSend["reply_markup"])

  options =
    method: "POST"
    payload: objToSend
  url = "https://api.telegram.org/bot#{CONSTANTS.secret}/sendMessage"

  UrlFetchApp.fetch url, options

  #log
  logEvent(objToSend)

setTelegram = ->
  secretTelegram = CONSTANTS.secret
  driveUrl = ScriptApp.getService().getUrl()
  URL = 'https://api.telegram.org/bot' + secretTelegram + '/setWebhook?url=' + driveUrl
  response = UrlFetchApp.fetch(URL)
  #Logger.log(response.getContentText());
  result = JSON.parse(response.getContentText())
  if result.ok and result.result
    Logger.log 'Telegram URL Updated'
  response.getContentText()
  return

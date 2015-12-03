_doPostCommand = (command)->
  e ={postData:{}}
  tosend =
    update_id: 685769691
    message:
      message_id: 321
      from:
        id: CONSTANTS.testUser.id
        first_name: "test"
        last_name: "ing"
        username: CONSTANTS.testUser.username
      chat:
        id: CONSTANTS.testUser.id
        first_name: "testing"
        last_name: "in gas"
        username: CONSTANTS.testUser.username
        type: "private"
      date: 1448655088
      text: command
  e.postData.contents = JSON.stringify(tosend)
  doPost(e)

_sendCommand = (command)->
  setGlobalVariable('session', {})
  allData =
    message:
      chat:
        id:CONSTANTS.testUser.id,
        username:CONSTANTS.testUser.username
  telegramPost CONSTANTS.testUser.id,execCommand(command,user: CONSTANTS.testUser.username,allData:allData)

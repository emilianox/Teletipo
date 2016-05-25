CONSTANTS =
  commmandInfo : "/sendInfo"
  secret :"12232131:hereTelegramSecretKey"
  logSheet: "bots-logs"
  supervacaID:1244343
  #default keyboard
  keyboard :[
        [ "/test1" ],
        [ "/test2" ]
  ]
  testUser:
    username:"emilianohfernandez"
    id:"1244343"
  googleAppScript:
    project_name:"projectNameInGoogleAppScript" #make sure than your proyect has no spaces
    id_gapps:"example-id-app-gas"



if exports?
  exports.CONSTANTS = CONSTANTS

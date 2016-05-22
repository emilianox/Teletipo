###*
 * Validate authorization for user
 * @param  {Object} command Commands.
 * @param  {Array.<string>} command.roles Roles autorized for that command
 * @param  {Object} command.fn Function to execute.
 * @param  {Object} params Params.
 * @param  {string} params.user Username.
 * @return {string} Result of execution.[description]
###
auth = (command, params) ->
  commandRoles = command.roles

  #command has public access
  if !commandRoles?
    return command.fn(params)
   #command has some restriction
  else
    #the user has not a special perms
    if !_users[params.user]?
      return "Unauthorized command."
    #user has espacial perms
    else
      userRoles = _users[params.user].roles
      #the sudo user can run any command
      if userRoles[0] is "sudo"
        return command.fn(params)
      else
        # for every userRol, try to find a fnAuthRol
        for userRol in userRoles
          # if match a role of command with the role of user
          if userRol in commandRoles
            return command.fn(params)
        return "Unauthorized command."


###*
 * Execute a command
 * @param  {Object} command Commands.
 * @param  {Array.<string>} command.roles Roles autorized for that command
 * @param  {Object} command.fn Function to execute.
 * @param  {Object} params Params.
 * @param  {string} params.user Username.
 * @return {string} Result of execution.[description]
###
execCommand = (command, params=false) ->
  if _commandlist[command]?
    auth(_commandlist[command], params)
  else
    "Command not found:  #{command}"

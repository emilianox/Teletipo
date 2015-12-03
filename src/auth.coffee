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
  fnAuthRoles = command.roles

  #is the public access
  if !fnAuthRoles?
    return command.fn(params)
  #is private
  else
    #the user has not a special perms
    if !_users[params.user]?
      return "Unauthorized command."

    else
      userRoles = _users[params.user].roles
      #is superuser
      if userRoles is "supervaca"
        return command.fn(params)
      else
        # for every userRol i try to find a fnAuthRol
        for a in userRoles
          if a in fnAuthRoles
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
execCommand = (command, params) ->
  params = false  unless params?

  if _commandlist[command]?
    auth _commandlist[command], params
  else
    "Command not found:  #{command}"

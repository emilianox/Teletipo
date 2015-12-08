config = require './src/configs/_config.coffee'
process = require('process')
exec = require('child_process').exec
print = (error, stdout, stderr)->
  console.log(stdout)

console.log "#####BEGIN SCRIPT#######"

# cd into folder of project
process.chdir("#{config.CONSTANTS.project_folder}/#{config.CONSTANTS.project_name}")
# gaps push
exec("gaps push",print)
process.chdir(config.CONSTANTS.project_folder)

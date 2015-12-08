config = require './src/configs/_config.coffee'
process = require('process')
exec = require('child_process').exec
print = (error, stdout, stderr)->
  console.log(stdout)

console.log "#####BEGIN SCRIPT#######"

# cd into folder of project
process.chdir(config.CONSTANTS.project_folder)

#clone proyect for GAS
exec("gaps clone #{config.CONSTANTS.id_gapps}",print)

# launch toffee
process.chdir("#{config.CONSTANTS.project_folder}/src")
exec("toffee -b -c -w -o ../#{config.CONSTANTS.project_name}/ *.coffee */*.coffee",print)
#while this script is alive you can edit coffee files and they will be compiled automatilly

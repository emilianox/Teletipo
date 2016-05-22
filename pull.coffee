config = require './src/configs/_config.coffee'
process = require('process')
exec = require('child_process').exec
print = (error, stdout, stderr)->
  console.log(stdout)

console.log "#####BEGIN SCRIPT#######"

# cd into folder of project
process.chdir(__dirname)
if config.CONSTANTS.googleAppScript.project_name
  exec("rm -rf #{__dirname}/#{config.CONSTANTS.googleAppScript.project_name}",(error, stdout, stderr)->
    #clone proyect for GAS
    console.log "clonning from gapps"
    exec("gaps clone #{config.CONSTANTS.googleAppScript.id_gapps}",(error, stdout, stderr)->
      console.log(stdout)
      console.log "Compiling..."
      # launch toffee
      process.chdir("#{__dirname}/src")
      console.log "while this script is alive you can edit coffee files and they will be compiled automatically"
      exec("toffee -b -c -w -o ../#{config.CONSTANTS.googleAppScript.project_name}/ *.coffee */*.coffee",print)
      #while this script is alive you can edit coffee files and they will be compiled automatically
    )
  )
else
  console.log "Please add CONSTANTS.googleAppScript.project_name in _configs.coffee"

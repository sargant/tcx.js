{exec} = require 'child_process'

task 'compile', 'Compiles coffee in src/ to js in lib/', ->
  compile()

task 'build', 'Currently synonymous with "compile"', ->
  compile()

compile = (callback) ->
  exec 'coffee -o ./lib/ -c ./src/', (err, stdout, stderr) ->
    throw err if err
    console.log "Compiled coffee files to ./lib"
    callback?()

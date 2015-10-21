CronJob = require("cron").CronJob

taskA = ->
  console.log "This is A"

job = new CronJob(
  cronTime: "0 0 * * * *"
  onTick: ->
    
    return
  start: true
)
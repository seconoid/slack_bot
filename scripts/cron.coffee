CronJob = require("cron").CronJob

taskA = ->
  console.log "This is A"

job = new CronJob(
  cronTime: "0 0 * * * *"
  onTick: ->
    
    return
  start: true
)

module.exports = (robot) ->
  cronjob = new CronJob('0 0 * * * *', () ->
    currentTime = new Date
    envelope = room: "#test"
    robot.send envelope, "#{currentTime.getHours()}時#{currentTime.getMinutes()}分だよ～"
  )

  cronjob.start()
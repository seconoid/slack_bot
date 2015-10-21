CronJob = require("cron").CronJob

taskA = ->
  console.log "This is A"

job = new CronJob(
  cronTime: "0 0 * * * *"
  onTick: ->
    11
    return
  start: true
)

module.exports = (robot) ->
  cronjob = new CronJob('0 0 * * * *', () ->
    currentTime = new Date
    envelope = room: "#test"
    robot.send envelope, "#{new Date().currentTime.getHours()}時だよ～"
  )

  cronjob.start()
CronJob = require("cron").CronJob

module.exports = (robot) ->
  
# hoge hage
  robot.hear /^hoge$/, (msg) ->
    msg.send "hage"

# WTF
  robot.hear /^wtf$/i, (msg) ->
    msg.send "http://media.biobiochile.cl/wp-content/uploads/2015/09/12176751.jpg"

# coin tos
  robot.hear /^アリス(.*)おはよう/, (msg) ->
    msg.send "おはようございます！"

# what time is it now
  robot.hear /(今|いま)何時/, (msg) ->
    currentTime = new Date()
    msg.send "#{currentTime.getHours()}時だよ！"

  cronjob = new CronJob('0 */3 * * * *', () ->
    currentTime = new Date
    envelope = room: "#test"
    console.log "#{currentTime.getHours()}時#{currentTime.getMinutes()}分だよ～"
  )

  cronjob.start()
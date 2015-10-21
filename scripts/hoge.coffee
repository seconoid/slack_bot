cronJob = require('cron').CronJob

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

# time signal
  send = (room, msg) ->
    response = new robot.Response(robot, {user : {id : -1, name : room}, text : "none", done : false}, [])
    response.send msg

    # *(sec) *(min) *(hour) *(day) *(month) *(day of the week)
    new cronJob('0 0 * * * *', () ->
      currentTime = new Data
      send '#test', "current time is #{new Date().currentTime.getHours()}:00.")
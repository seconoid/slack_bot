CronJob = require("cron").CronJob

module.exports = (robot) ->
  cronjob = new CronJob('0 0 8-23 * * *', () ->
    currentTime = new Date
    # 発言先のチェンネルを指定
    envelope = room: "#slack_bot"
    robot.send envelope, "ぽーん。#{currentTime.getHours()}時になりました！"
  )

  cronjob.start()
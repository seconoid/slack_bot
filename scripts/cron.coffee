CronJob = require("cron").CronJob

module.exports = (robot) ->
  # 時報
  #(sec min hour day month weekday)
  time_sig = new CronJob('0 0 8-23 * * *', () ->
    currentTime = new Date
    # 発言先のチェンネルを指定
    envelope = room: "#slack_bot"
    robot.send envelope, "ぽーん。#{currentTime.getHours()}時になりました！"
  )

  time_sig.start()
CronJob = require("cron").CronJob

module.exports = (robot) ->
  robot.respond /remind @(.*) to (.+) (in) (.*)$/i, (res) ->
    user = res.match[1]
    message = res.match[2]
    pre = res.match[3]
    date = res.match[4]
    d = new Date

    if pre is "in"
      if /sec/.test(date)
        sec = parseInt(date, 10)
        d.setTime(d.getTime() + sec * 1000)
      else if /min/.test(date)
        min = parseInt(date, 10)
        d.setTime(d.getTime() + min * 1000 * 60)
      else if /hour/.test(date)
        hour = parseInt(date, 10)
        d.setTime(d.getTime() + hour * 1000 * 60 * 60)

      remind = new CronJob(d, () ->
        res.send "<remind> @#{user} #{message}"
      )
      remind.start()

    ### at is can select time to send message
    else if pre is "at"
      if /.+(\d+)-(\d+).+/.test(date)
        res.send "true"
      else
        res.send "false"
    ###

    #time = new Date(date)
    #res.send "#{time}"
    res.send "@#{user} さんへのメッセージを登録したよ。"
    
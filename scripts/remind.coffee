CronJob = require("cron").CronJob

module.exports = (robot) ->
  robot.respond /remind @(.*) to (.+) (in|at) (.*)$/i, (res) ->
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

    else if pre is "at"
      if /^(\d{4})-(\d{1,2})-(\d{0,2}) (\d{1,2}:\d{1,2})$/.test(date)
        time = date.split (/-|:|\s/)
        d.setFullYear time[0]
        d.setMonth time[1]-1
        d.setDate time[2]
        d.setHours time[3]
        d.setMinutes time[4]
        d.setSeconds 0

      else if /^(\d{1,2})-(\d{1,2}) (\d{1,2}:\d{1,2})$/.test(date)
        time = date.split(/-|:|\s/)
        d.setMonth time[0]-1
        d.setDate time[1]
        d.setHours time[3]
        d.setMinutes time[3]
        d.setSeonds 0
      else if /^(\d{1,2}:\d{1,2})$/.test(date)
        time = date.split(":")
        d.setHours time[0]
        d.setMinutes time[1]
        d.setSeconds 0
      else if /^(\d{1,2})-(\d{1,2})$/.test(date)
        time = date.split("-")
        d.setMonth time[0]-1
        d.setDate time[1]
        d.setHours 8
        d.setMinutes 0
        d.setSeconds 0 
      else
        res.send "Err!"

      remind = new CronJob(d, () ->
        res.send "<remind> @#{user} #{message}"
      )
      remind.start()

    else
      res.send "Err!"

    #time = new Date(date)
    #res.send "#{time}"
    res.send "@#{user} さんへのメッセージを登録したよ。"
    
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
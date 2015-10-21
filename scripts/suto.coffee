module.exports = (robot) ->
  
# good!
  robot.hear /^good$/i, (msg) ->
    msg.send "http://cdn-ak.f.st-hatena.com/images/fotolife/p/ptrst/20150630/20150630232511.jpg"
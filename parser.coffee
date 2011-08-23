fs = require 'fs'
{log, inspect} = require 'util'

readStream = fs.createReadStream('./xvideos.csv')

tile = ''
readStream.on 'data', (data) ->
  readStream.pause()
  lines = data.toString('utf8', 0).split('\n')
  if data[data.length] isnt '0A'
    lines[0] = tile + lines[0]
    tile = lines[lines.length]

  for line in lines
    do(line) ->
      datas = line.split(';')
      video =
        url: datas[0]
        title: datas[1]
        duration: datas[2]
        thumb: datas[3]
        object: datas[4]
        tags: "#{datas[5]}".split(',')
        category: datas[6]
      saveVideo video
saveVideo = (video)->
  log(inspect video)

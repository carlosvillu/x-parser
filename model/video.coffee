mongoose = require './common'
TagSchema = require('./tag').TagSchema

exports.VideoSchema = VideoSchema = new mongoose.Schema({
  url: String
  , duration: String
  , thumb: String
  , object: String
  , tags: [TagSchema]
  , category: String
  , source: String
})

VideoSchema.path('duration').set((v)->
  return parseInt v
)
exports.Video =  mongoose.model('Video', VideoSchema)

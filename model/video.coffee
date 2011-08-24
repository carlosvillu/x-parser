mongoose = require './common'
TagSchema = require('./tag').TagSchema

exports.VideoSchema = VideoSchema = new mongoose.Schema({
  url: String
  , duration: Number
  , thumb: String
  , object: String
  , tags: [TagSchema]
  , category: String
  , source: String
})

VideoSchema.path('duration').set (v)->
  parts = v.split ' ';
  return parts[0]

exports.Video =  mongoose.model('Video', VideoSchema)

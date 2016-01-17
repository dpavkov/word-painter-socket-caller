require 'sinatra'
require 'json'
require "sinatra/json"
require 'pusher'

pusher_key = ENV['PUSHER_KEY']
pusher_secret = ENV['PUSHER_SECRET']
pusher_id = ENV['PUSHER_ID']
Pusher.url = "https://#{pusher_key}:#{pusher_secret}@api.pusherapp.com/apps/#{pusher_id}"


set :port, 4568

post '/do-stream', provides: 'json' do
  body = JSON.parse request.body.read
  validation_result = validate(body)
  if validation_result.nil?
    stream_back(body['word'], body['color'], body['channel'])
    json body
  else
    status 400
    json error: validation_result
  end
end

def validate input
  if (! input["word"] || input["word"] == "")
    "no streaming without the word"
  elsif (! input["color"] || input["color"] == "")
    "no streaming without color"
  elsif (! input["channel"] || input["channel"] == "")
    "no streaming without channel, we wouldn't know where to stream"
  else
    nil
  end
end

def stream_back(word, color, channel)
  Pusher.trigger(channel, 'word', {
      word: word, color: color
  })
end


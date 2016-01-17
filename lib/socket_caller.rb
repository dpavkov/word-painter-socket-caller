require 'sinatra'
require 'json'
require "sinatra/json"

set :port, 4568

post '/do-stream', provides: 'json' do
  body = JSON.parse request.body.read
  validation_result = validate(body)
  if validation_result.nil?
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
  else
    nil
  end
end

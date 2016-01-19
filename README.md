# word-painter-socket-caller
Micro service which accepts a word and its color and forwards them to the user's browser via web sockets Can be used with https://github.com/dpavkov/reading-helper and https://github.com/dpavkov/word-painter-socket-caller to form a nice application for fast reading of the content.
# setup
To set up the application, after cloning the repository, first run _bundle install_ to download all dependencies.

Set the following environment variables: PUSHER_SECRET, PUSHER_ID and PUSHER_KEY. They are necessary to contact pusher server (see https://pusher.com/websockets)
 * 

run _ruby lib/socket_caller.rb_
# testing the application

Run _rake_ to run tests.
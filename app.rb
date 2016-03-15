
require( 'sinatra' )
require('pry-byebug')
require_relative('./controllers/albums_controller.rb')
require_relative('./controllers/artists_controller.rb')
require_relative('./controllers/stocked_controller.rb')

require 'sinatra/contrib/all' if development?

get '/' do
  erb :"home"
end
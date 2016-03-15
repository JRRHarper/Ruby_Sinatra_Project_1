require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('../models/stock.rb')

# INDEX
get '/stocked' do
  @albums = Album.all
  @artists = Artist.all
  @stocked = Stock.all
  erb :'stocked/index'
end

# NEW
get '/stocked/new' do
  erb :'stocked/new'
end

# UPDATE ALL stock
post '/stocked' do 
  Stock.update_all( params )
  redirect '/stocked'
end

get '/stocked/search' do 
  @albums = Album.all
  @artists = Artist.all
  @stocked = Stock.search( params )
  erb :'stocked/index'
end

# SHOW
get '/stocked/:id' do
  erb :'stocked/show'
end

# EDIT
get '/stocked/:id/edit' do
  erb :'stocked/edit'
end

# UPDATE 
put '/stocked/:id' do
  erb :'stocked/update'
end

# DELETE
delete '/stocked/:id/delete' do
  erb :'stocked/index'
end
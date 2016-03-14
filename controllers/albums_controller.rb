require_relative('../models/album.rb')
require_relative('../models/artist.rb')

#index
get '/albums' do
  @albums = Album.all()
  erb :"albums/index"
end

#new
get '/albums/new' do
  erb :"albums/new"
end

#show
get '/albums/:id' do
  erb :"albums/show"
end

#edit
get 'albums/edit' do
  erb :"albums/edit"
end

#create
post '/albums' do
  @albums = Album.new(params)
  @albums.save()
  redirect to("/albums")
end

#update
post '/albums/:id' do
  @artists = Album.update(params)
  redirect to( "/albums")
end

#destroy
post '/albums/:id/delete' do
  Album.delete(params[:id])
  redirect to("/albums")
end
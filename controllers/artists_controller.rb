require_relative('../models/artist.rb')
require_relative('../models/album.rb')


#index
get '/artists' do
  @artists = Artist.all()
  erb :"artists/index"
end

#new
get '/artists/new' do
  erb :'artists/new'
end

#show
# get '/artists/:id' do
#   @artists = Artist.find(params[:id])
#   erb :"artists/show"
# end

#edit
get '/artists/:id/edit' do
  @artist = Artist.find(params[:id])
  erb :"artists/edit"
end

#create
post '/artists' do
  @artists = Artist.new(params)
  @artists.save()
  redirect to("/artists")
end

#update
post '/artists/:id' do
  @artists = Artist.update(params)
  redirect to( "/artists")
end

#destroy
post '/artists/:id/delete' do
  Artist.delete(params[:id])
  redirect to("/artists")
end
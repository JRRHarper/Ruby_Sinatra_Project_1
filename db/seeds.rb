require_relative( '../models/album.rb' )
require_relative( '../models/artist.rb' )
require_relative( '../models/stock.rb' )
require( 'pry-byebug' )

Stock.delete_all
Album.delete_all
Artist.delete_all


#artists
artist1 = Artist.new({ 'name' => 'Nightwish'})
artist2 = Artist.new({ 'name' => 'Epica'})
artist3 = Artist.new({ 'name' => 'Eluveitie'})

art1 = artist1.save
art2 = artist2.save
art3 = artist3.save


#albums for artist 1
album1 = Album.new({ 'title' => 'Once', 'artist_id' => art1.id})
album2 = Album.new({ 'title' => 'Endless Forms Most Beautiful', 'artist_id' => art1.id})
album1.save
album2.save

#albums for artist 2
album3 = Album.new({ 'title' => 'The Quantum Enigma', 'artist_id' => art2.id})
album4 = Album.new({ 'title' => 'Design Your Universe', 'artist_id' => art2.id})
album3.save
album4.save

#albums for artist 3
album5 = Album.new({ 'title' => 'Origins', 'artist_id' => art3.id})
album6 = Album.new({ 'title' => 'Helvetios', 'artist_id' => art3.id})
album5.save
album6.save


nil
require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/album.rb'
require_relative '../models/artist.rb'
require_relative '../models/stock.rb'

class TestStock < MiniTest::Test

  def setup
    @artist = Artist.new({ 'name' => "Nightwish" })
    @album = Album.new({ 'title' => "Once", 'artist_id' => @artist, 'id' => 1 })    
    params = {
      'album_id' => @album.id,
      'quantity' => 10,
    }
    @stock = Stock.new( params )
  end

  def test_stock_album
    result = @stock.album_id
    assert_equal( 1, result )
  end

  def test_stock_quantity
    result = @stock.quantity
    assert_equal( 10, result)
  end

end
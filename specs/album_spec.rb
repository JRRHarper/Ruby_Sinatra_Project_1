require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/album.rb'
require_relative '../models/artist.rb'


class TestAlbum < MiniTest::Test

  def setup 
    @artist = Artist.new({ 'name' => "Nightwish" })
    @album = Album.new( 'title' => "Once", 'artist_id' => 2, 'stock_level' => 10, 'buy_price' => 5, 'sell_price' => 10, 'id' => 1 )
  end

  def test_album_title
    result = @album.title
    assert_equal("Once", result)    
  end

  def test_album_id
    result = @album.id
    assert_equal( 1, result )
  end

  def test_check_stock
    result = @album.check_stock
    assert_equal("High Stock", result)
  end


end
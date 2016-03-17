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

  def test_stock_level
    result = @album.stock_level
    assert_equal(10, result)
  end

  def test_buy_price
    result = @album.buy_price
    assert_equal(5, result)
  end

  def test_sell_price
    result = @album.sell_price
    assert_equal(10, result)
  end

  def test_check_stock
    result = @album.check_stock
    assert_equal("High Stock", result)
  end

  def test_markup_value
    result = @album.markup_value
    assert_equal(5, result)
  end

  def test_profit_loss
    result = @album.profit_loss
    assert_equal("Profit", result)
  end

end
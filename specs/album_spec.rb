
require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/album.rb'
require_relative '../models/artist.rb'


class TestAlbum < MiniTest::Test

  def setup 
    @artist = Artist.new({ 'name' => "Nightwish" })
    @album = Album.new( 'title' => "Once", 'id' => 1 )
  end

  def test_album_title
    result = @album.title
    assert_equal("Once", result)    
  end

  def test_album_id
    result = @album.id
    assert_equal( 1, result )
  end


end
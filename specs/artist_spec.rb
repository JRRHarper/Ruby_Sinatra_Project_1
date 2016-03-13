require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/artist'


class TestArtist < MiniTest::Test

  def setup 
    @artist = Artist.new({ 'name' => "Nightwish", 'id' => 1 })
  end

  def test_artist_name
    result = @artist.name
    assert_equal("Nightwish", result )    
  end

  def test_artist_id
    result = @artist.id
    assert_equal( 1, result )
  end



end
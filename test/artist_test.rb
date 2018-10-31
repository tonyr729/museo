require 'minitest/autorun'
require 'minitest/pride'
require './lib/artist'

class ArtistTest < Minitest::Test
  def setup
    @attributes = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    @artist = Artist.new(@attributes)
  end

  def test_it_exists
    assert_instance_of Artist, @artist
  end

  def test_it_has_an_id
    assert_equal @attributes[:id], @artist.id
  end

  def test_it_has_an_name
    assert_equal @attributes[:name], @artist.name
  end

  def test_it_has_an_born
    assert_equal @attributes[:born], @artist.born
  end

  def test_it_has_an_died
    assert_equal @attributes[:died], @artist.died
  end

  def test_it_has_an_country
    assert_equal @attributes[:country], @artist.country
  end
end

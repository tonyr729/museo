require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'

class PhotographsTest < Minitest::Test
  def setup
    @attributes = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "4",
      year: "1954"
    }
    @photograph = Photograph.new(@attributes)
  end

  def test_it_exists
    assert_instance_of Photograph, @photograph
  end

  def test_it_has_an_id
    assert_equal @attributes[:id], @photograph.id
  end

  def test_it_has_an_name
    assert_equal @attributes[:name], @photograph.name
  end

  def test_it_has_an_artist_id
    assert_equal @attributes[:artist_id], @photograph.artist_id
  end

  def test_it_has_an_year
    assert_equal @attributes[:year], @photograph.year
  end
end

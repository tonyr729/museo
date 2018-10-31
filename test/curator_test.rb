require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'

class CuratorTest < Minitest::Test
  def setup
    @curator = Curator.new
  end

  def test_it_exists
    assert_instance_of Curator, @curator
  end

  def test_it_has_a_collection_of_artists
    assert_equal [], @curator.artists
  end

  def test_it_has_a_collection_of_photographs
    assert_equal [], @curator.photographs
  end
end

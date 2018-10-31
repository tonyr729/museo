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

  def test_it_can_add_photographs
    photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }

    photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }

    @curator.add_photographs(photo_1)
    @curator.add_photographs(photo_2)

    assert_equal [photo_1, photo_2], @curator.photographs
    assert_equal photo_1, @curator.photographs.first
  end

  def test_it_can_add_artists
    artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }

    artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }

    @curator.add_artists(artist_1)
    @curator.add_artists(artist_2)

    assert_equal [artist_1, artist_2], @curator.artists
    assert_equal artist_1, @curator.artists.first
  end

  def test_it_can_find_a_photograph_by_id
    photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }

    photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }

    @curator.add_photographs(photo_1)
    @curator.add_photographs(photo_2)

    assert_equal photo_2, @curator.find_photograph_by_id("2")
  end

  def test_it_can_find_a_artist_by_id
    artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }

    artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }

    @curator.add_artists(artist_1)
    @curator.add_artists(artist_2)

    assert_equal artist_2, @curator.find_artist_by_id("2")
  end
end

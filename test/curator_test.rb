require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'

class CuratorTest < Minitest::Test
  def setup
    @curator = Curator.new
    @artists = [
      artist_1 = {
        id: "1",
        name: "Henri Cartier-Bresson",
        born: "1908",
        died: "2004",
        country: "France"
      },
      artist_2 = {
        id: "2",
        name: "Ansel Adams",
        born: "1902",
        died: "1984",
        country: "United States"
      },
      artist_3 = {
        id: "3",
        name: "Diane Arbus",
        born: "1923",
        died: "1971",
        country: "United States"
      }
    ]
    @photographs = [
      photo_1 = {
        id: "1",
        name: "Rue Mouffetard, Paris (Boy with Bottles)",
        artist_id: "1",
        year: "1954"
      },
      photo_2 = {
        id: "2",
        name: "Moonrise, Hernandez",
        artist_id: "2",
        year: "1941"
      },
      photo_3 = {
        id: "3",
        name: "Identical Twins, Roselle, New Jersey",
        artist_id: "3",
        year: "1967"
      },
      photo_4 = {
        id: "4",
        name: "Child with Toy Hand Grenade in Central Park",
        artist_id: "3",
        year: "1962"
      }
    ]
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
    @curator.add_photographs(@photographs[0])
    @curator.add_photographs(@photographs[1])

    assert_equal "1", @curator.photographs.first.id
    assert_equal "2", @curator.photographs.last.id
    assert_equal "Moonrise, Hernandez", @curator.photographs.last.name
  end

  def test_it_can_add_artists
    @curator.add_artists(@artists[0])
    @curator.add_artists(@artists[1])

    assert_equal "1", @curator.artists.first.id
    assert_equal "2", @curator.artists.last.id
    assert_equal "Henri Cartier-Bresson", @curator.artists.first.name
  end

  def test_it_can_find_a_photograph_by_id
    @curator.add_photographs(@photographs[0])
    @curator.add_photographs(@photographs[1])

    actual = @curator.find_photograph_by_id("2")

    assert_equal "2", actual.id
    assert_equal "Moonrise, Hernandez", actual.name
  end

  def test_it_can_find_a_artist_by_id

    @curator.add_artists(@artists[0])
    @curator.add_artists(@artists[1])

    actual = @curator.find_artist_by_id("2")

    assert_equal "2", actual.id
    assert_equal "Ansel Adams", actual.name
  end

  def test_it_can_find_photographs_by_artist
    @curator.add_artists(@artists[0])
    @curator.add_artists(@artists[1])
    @curator.add_artists(@artists[2])
    @curator.add_photographs(@photographs[0])
    @curator.add_photographs(@photographs[1])
    @curator.add_photographs(@photographs[2])
    @curator.add_photographs(@photographs[3])

    diane_arbus = @curator.find_artist_by_id("3")

    actual = @curator.find_photographs_by_artist(diane_arbus)

    assert_equal 2, actual.length
    assert_equal "3", actual.first.id
    assert_equal "Identical Twins, Roselle, New Jersey", actual.first.name
    assert_equal "4", actual.last.id
    assert_equal "Child with Toy Hand Grenade in Central Park", actual.last.name
  end
end

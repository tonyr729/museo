require_relative '../lib/artist'
require_relative '../lib/photograph'


class Curator

  attr_reader :artists, :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photographs(photo)
    @photographs << Photograph.new(photo)
  end

  def add_artists(artist)
    @artists << Artist.new(artist)
  end

  def find_photograph_by_id(id)
    @photographs.find {|photograph| photograph.id == id }
  end

  def find_artist_by_id(id)
    @artists.find {|artist| artist.id == id }
  end

  # def find_photographs_by_artist(artist)
  #   @photographs.find {|photograph| photograph[:artist_id] == artist.id}
  # end
end

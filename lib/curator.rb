class Curator

  attr_reader :artists, :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photographs(photo)
    @photographs << photo
  end

  def add_artists(artist)
    @artists << artist
  end

  def find_photograph_by_id(id)
    @photographs.find {|photograph| photograph[:id] == id }
  end

  def find_artist_by_id(id)
    @artists.find {|artist| artist[:id] == id }
  end
end

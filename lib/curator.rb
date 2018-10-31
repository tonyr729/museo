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
end

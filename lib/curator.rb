class Curator

  attr_reader :artists, :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photographs(photo)
    @photographs << photo
  end
end

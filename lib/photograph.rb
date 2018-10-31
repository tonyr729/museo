class Photograph
  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @artist_id = attributes[:artist_id]
    @year = attributes[:year]
  end
end

require_relative '../lib/artist'
require_relative '../lib/photograph'
require 'csv'


class Curator

  attr_reader :artists, :photographs

  def initialize
    @artists = []
    @photographs = []
  end


  def add_photographs(photo)
    @photographs << Photograph.new(photo)
  end

  def load_photographs(path)
    parsed_photo_data = parser(path)
    parsed_photo_data.each do |photo_data|
      @photographs << Photograph.new(photo_data)
    end
  end

  def load_artists(path)
    parsed_artist_data = parser(path)
    parsed_artist_data.each do |artist_data|
      @artists << Artist.new(artist_data)
    end
  end

  def parser(path)
    file = CSV.read(path, headers: true, header_converters: :symbol)
    file.map {|row| row.to_h}
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

  def find_photographs_by_artist(artist)
    @photographs.select {|photograph| photograph.artist_id == artist.id}
  end

  def artists_with_multiple_photographs
    grouped_by_artist = @photographs.group_by {|photograph| photograph.artist_id}
    grouped_by_artist.inject([]) do |busy_artists, (id, photos)|
      busy_artists << find_artist_by_id(id) if photos.length > 1
      busy_artists
    end
  end

  def photographs_taken_by_artists_from(location)
    photos = @artists.inject([]) do |matched_photos, artist|
      matched_photos << find_photographs_by_artist(artist) if artist.country == location
      matched_photos
    end
    photos.flatten!
  end
end

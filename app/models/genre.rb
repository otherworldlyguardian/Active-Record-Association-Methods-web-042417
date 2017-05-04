class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.size
  end

  def artist_count
    art = []
    self.songs.each do |song|
      art << song.artist if !art.include?(song.artist)
    end
    art.size
  end

  def all_artist_names
    art = []
    self.songs.each do |song|
      art << song.artist.name if !art.include?(song.artist.name)
    end
    art
  end
end

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist == nil
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre == nil || genre.songs.include?(self)
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  
  def self.find_by_name(song)
    self.all.detect { |s| s.name == song }
  end
  
  def self.find_or_create_by_name(song)
    if self.find_by_name(song)
      self.find_by_name(song)
    else
      self.create(song)
    end
  end
  
end
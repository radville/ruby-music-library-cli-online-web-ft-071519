class Artist
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def genres
    self.songs.map { |song| song.genre }.uniq
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless self.songs.include?(song)
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
    artist = self.new(name)
    artist.save
    artist
  end
  
end
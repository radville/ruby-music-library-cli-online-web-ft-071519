class Artist
  
  attr_accessor :name
  attr_reader :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def genres
    self.songs.map do |song|
      song.genre
    end
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
    song = self.new(name)
    song.save
    song
  end
  
end
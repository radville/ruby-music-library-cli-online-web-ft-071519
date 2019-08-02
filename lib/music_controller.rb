require "pry"

class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end
  
  def call
    input = nil
    until input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip
    end
  end
    
  def list_songs
    sorted = Song.all.sort_by { |s| s.name}
    sorted.each_with_index { |song, i| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end
    
  def list_artists
    sorted = Artist.all.sort_by { |a| a.name}
    sorted.each_with_index { |artist, i| puts "#{i+1}. #{artist.name}" }
  end
    
  def list_genres
    sorted = Genre.all.sort_by { |g| g.name}
    sorted.each_with_index { |genre, i| puts "#{i+1}. #{genre.name}" }
  end
    
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    artist = Artist.find_by_name(input)
    if artist 
      sorted_songs = artist.songs.sort_by { |s| s.name }
      sorted_songs.each_with_index do |song, i|
        puts "#{i+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.find_by_name(input)
    if genre 
      sorted_songs = genre.songs.sort_by { |s| s.name }
      sorted_songs.each_with_index do |song, i|
        puts "#{i+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp
    if input.to_i == Integer
      sorted = Song.all.sort_by { |s| s.name}
      song = sorted[input.to_i+1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
  
end
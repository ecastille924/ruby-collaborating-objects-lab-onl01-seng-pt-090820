class Artist

  attr_accessor :name
  #attr_reader :songs
  
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
  
  def songs 
    Song.all.select do |song|
      song.artist == self
    end
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def self.find_or_create_by_name(name)
    if self.find(name) 
      self.find(name)
    else
      self.new 
    end
  end
  
  def self.find(name)
    self.all.find do |artist|
      artist.name == name
    end
  end
  
  def print_songs
    self.songs.each do |song|
      puts song.name
    end       
  end

end

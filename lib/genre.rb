class Genre
  attr_accessor :name

  @@all = []

  def initialize(genre_name)
    @name = genre_name
    @@all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all do |song|
      song.genre == self
    end
  end

  def artists
    songs.collect(&:artist) # https://stackoverflow.com/questions/9429819/what-is-the-functionality-of-operator-in-ruby
  end

  def add_song(song)
    songs << song
  end
end

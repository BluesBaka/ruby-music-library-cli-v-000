class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all =[]

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
      @@all.clear
    end

  def save
    @@all << self
  end

    def genres
      self.songs.collect {|g| g.genre}.uniq
    end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def self.create(name)
    new(name).tap{|a| a.save}
  end

  def to_s
    self.name
   end

end

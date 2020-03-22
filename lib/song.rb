class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
      song = self.create
      song.name = song_name
      song
  end

  def self.find_by_name(song_name)
    self.all.find { |s| s.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    find_song = self.find_by_name(song_name)
    if find_song
      find_song
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |s|
      s.name
    end
  end

  def self.new_from_filename(song_name)
    arr = song_name.split(" - ")    
    arr[1] = arr[1].chomp(".mp3")
    song = self.new
    song.name = arr[1]
    song.artist_name = arr[0]
    song
  end

  def self.create_from_filename(song_name)
    arr = song_name.split(" - ")    
    arr[1] = arr[1].chomp(".mp3")
    song = self.create
    song.name = arr[1]
    song.artist_name = arr[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
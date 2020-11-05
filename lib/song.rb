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
    song.save 
    song
  end
    #initializes a song
    #saves it to the @@all literally or through Song.all
    #return the song instance that was initialized and saved
  

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end


  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)

      file = filename.split(" - ")
      # For each row/file, let's collect a Person/Song instance based on the data
      artist_name = file[0]
      name = file[1].gsub(".mp3", "")
      song = self.new # self refers to the Song class. This is Person.new
      song.name = name
      song.artist_name = artist_name
      song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  
  end

  def self.destroy_all
    self.all.clear
  end
    #file name in form of "Artist - Song Name.mp3"
    #return a new song instance with song.name = Song Name & song.artist_name = Artist
    #separate the artist name from the rest of data
    #remove the .mp3


end


# song = Song.create
# Song.all.include?(song) =>true
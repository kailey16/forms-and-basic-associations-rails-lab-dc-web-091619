class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
    if self.artist
    self.artist.name
    end
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def genre_name
    if self.genre
    self.genre.name
    end
    # self.genre ? self.genre.name : nil (ternary)
  end

  def note_contents=(contents)
    contents.each do |content|
      if content.length != 0
        note = Note.find_or_create_by(content: content)
        self.notes << note
      end
    end
  end


  def note_contents
    self.notes.map(&:content)
  end

end

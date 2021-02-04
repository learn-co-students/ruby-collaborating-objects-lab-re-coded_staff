class Artist
    @@all = []
    attr_accessor :name
    def initialize(name)
        @name = name
        save
    end
    def save
        @@all << self
    end
    def self.all
        @@all
    end
    def add_song(song)
        song.artist = self
    end
    def songs
        Song.all.select {|song| song.artist == self}
    end
    def self.find_or_create_by_name(name)
        puts @@all.detect { |artist| artist.name == name }
        @@all.detect { |artist| artist.name == name } ? @@all.detect { |artist| artist.name == name } : Artist.new(name)
    end
    def print_songs
        puts songs.map{|song| song.name}
    end
end
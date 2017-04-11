# For our purposes the Pokemon class is responsible for saving, adding,
# removing, or changing anything about each Pokémon. Your scraper is not
# responsible for knowing anything about them.

class Pokemon
attr_reader :id, :name, :type, :db

@@all = []

  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.all
    @@all
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
  new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
  @@all << Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: db)
  return @@all.last
  end

end

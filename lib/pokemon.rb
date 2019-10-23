class Pokemon
  attr_accessor :name, :type, :id, :db 
  
  def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name 
    @type = type
    @db = db 
  end 
  
  def self.save(name, type, database) 

      sql = <<-SQL
      INSERT INTO pokemons (name, type, id) VALUES (?, ?, ?)
      SQL
      DB[:conn].execute(sql, self.name, self.type, self.id)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemons")[0][0]

  end 
  
  
end

require 'pry'

class Pokemon
  attr_accessor :name, :type, :id, :db 
  
  def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name 
    @type = type
    @db = db 
  end 
  
  def self.save(name, type, database) 
      sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
      database.execute(sql, name, type)
      @id = database.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end 
  
  def self.find(id, database) 
    sql = "SELECT * FROM pokemon WHERE id = ?"
    result = database.execute(sql, id)[0]
    binding.pry 
    Pokemon.new(result[0], result[1], result[2], db)
  end 
  
  
end

class Pokemon
  attr_accessor :name, :type, :id, :db 
  
  def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name 
    @type = type
    @db = db 
  end 
  
  def self.save(name, type, db) 
      sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
      db.execute(sql, name, type)
      @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end 
  
  def self.find 
    sql = "SELECT * FROM pokemon WHERE id = ?"
    result = @db.execute(sql, id)[0]
    Pokemon.new(result[0], result[1], result[2], result[3])
  end 
  
  
end

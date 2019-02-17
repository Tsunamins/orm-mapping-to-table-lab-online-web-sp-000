class Student
        attr_accessor :name, :grade 
        attr_reader :id 
        
  
        
  def initialize(name, grade)
    @name = name
    @grade = grade
    @id = id 
    
    
  end 
  
  
        
  def self.create_table 
    sql = 
    "CREATE TABLE IF NOT EXISTS students (id INTEGER PRIMARY KEY, name TEXT, grade INTEGER)"
   
    
    DB[:conn].execute(sql)
  end 
  
  def self.drop_table 
    sql = "DROP TABLE students"
    
    DB[:conn].execute(sql)
  end 
  
  def save 
   sql = "INSERT INTO students (name, grade) VALUES (?, ?)" 
   
   DB[:conn].execute(sql, self.name, self.grade)
   
   @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
   
  end 
  
  def self.create(hash) 
    
      
      hash.each do |attribute, value| 
        
        find_var = self.send("#{attribute} = ", "#{value}")
          # self.new(find_var)
        
      end 
      self.save
      
     
    end 
  
end
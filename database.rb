module Data_manager
  def presist
    #presist code here
  end

  def loaddata
    if File.exist?("./data/books.json")
       @books = JSON.parse(File.read("./data/books.json")).map {|book| Book.new(book["Title"], book["Author"])}
    else
      File.write("./data/books.json", [])
    end
    if File.exist?("./data/persons.json")
      @persons = JSON.parse(File.read("./data/persons.json")).map {|person| 
       person["specialization"] ? 
       Teacher.new(person["name"], person["age"],  person["specialization"], person["id"]) : 
       Student.new(person["name"], person["age"], person["id"], person["parent_permission"]) 
      }
    else  
      File.write("./data/persons.json", [])
    end 

    if File.exist?("./data/rentals.json")
      @rentals = JSON.parse(File.read("./data/rentals.json")).map {
        |rental|
         Rental.new(
          rental['date'],
          @books.select {|book| book.title == rental["book"]}[0],
          @persons.select {|person| person.id == rental["id"]}[0])
        }
    else
       File.write("./data/rentals.json", [])
    end 
  end
end
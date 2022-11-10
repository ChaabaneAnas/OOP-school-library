module Data_manager
  def presist
  hbooks = @books.map {|book| {Title: book.title, Author: book.author}}
  File.write("./data/books.json", "#{JSON.pretty_generate(hbooks)}")

  hpersons = @persons.map {|person|
  person.class == Teacher ? {id: person.id, name: person.name, age: person.age, specialization: person.specialization } : {id: person.id, name: person.name, age: person.age, parent_permission: person.parent_permission}}
  File.write("./data/persons.json", "#{JSON.pretty_generate(hpersons)}")

  jrentals = @rentals.map {|rental| {id: rental.person.id, date: rental.date, book: rental.book.title, person: rental.person.name }}
  File.write("./data/rentals.json", "#{JSON.pretty_generate(jrentals)}")
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
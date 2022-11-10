require './book'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'
require './database'
require 'json'

class App
  attr_accessor :persons, :books

  include Data_manager
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def menu
    puts
    puts 'Choose an option by entering a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def excute(user_input)
    case user_input
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_a_person
    when 4
      create_a_book
    when 5
      create_a_rental
    when 6
      list_rentals_for_a_given
    when 7
      quit_app
    else
      'invalid input pls try again'
    end
  end

  def create_a_teacher
    puts 'Teacher Name: '
    name = gets.chomp

    puts 'Teacher Age: '
    age = gets.chomp.to_i

    puts 'Teacher specialization: '
    specialization = gets.chomp

    id = rand(1..1000)

    teacher = Teacher.new(name, age, specialization, id)
    @persons.push(teacher)
    puts "Teacher #{name} created Seuccssefully"
  end

  def create_a_student
    puts 'Student Name: '
    name = gets.chomp

    puts 'Student Age: '
    age = gets.chomp.to_i

    puts 'parent_permission [y/n]: '
    parent_permission = gets.chomp
    case parent_permission
    when 'y'
      parent_permission = true
    when 'n'
      parent_permission = false
    end

    id = rand(1..1000)

    student = Student.new(name, age, id, parent_permission)
    @persons.push(student)
    puts "Student #{name} Created succssefully"
  end

  def create_a_person
    puts 'do you want to create a teacher(1) or a student(2), input a number:'

    choice = gets.chomp.to_i
    case choice
    when 1
      create_a_teacher
    when 2
      create_a_student
    else
      puts 'please give a number between (1) and (2) '
    end
  end

  def create_a_book
    puts 'Title: '
    title = gets.chomp

    puts 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)
    puts "book #{title} created succssefully"
  end

  def list_all_books
    p @books
    puts 'You have no books yet, Add a book.' if @books.empty?
    @books.each.with_index { |book, index| puts "#{index}) [Book] Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_people
    puts 'You have no peopel yet, Add a person' if @persons.empty?
    @persons.each.with_index do |person, index|
      puts "#{index}) Name: #{person.name}, Age: #{person.age}, id: #{person.id}"
    end
  end

  def create_a_rental
    puts 'Select a book from the following by number: '
    list_all_books
    bchoice = gets.chomp.to_i
    book = @books[bchoice]

    puts 'Select a book from the following by number: '
    list_all_people
    pchoice = gets.chomp.to_i
    person = @persons[pchoice]

    puts 'date: '
    date = gets.chomp

    @rentals.push(Rental.new(date, book, person))
    puts 'rental created succssefully'
  end

  def list_rentals_for_a_given
    puts 'enter person id: '
    id = gets.chomp.to_i
    @persons.each do |item|
      next unless item.id == id

      item.rentals.map.with_index do |rental, index|
        puts "#{index}) Date: #{rental.date} Book: #{rental.book.title} Person: #{rental.person.name}"
      end
    end
    # puts @rentals.filter { |rental| rental["id"] = id}
  end

  def quit_app
    puts 'thanks for using our app'
    presist
    exit
  end
end

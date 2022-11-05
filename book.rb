class Book
  attr_accessor :rentals
  attr_reader :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
end

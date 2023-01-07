class App
    attr_accessor :books, :people, :rentals
    
    def initialize
        @books = []
        @people = []
        @rentals = []

    def create_person
        puts "Please input the name"
        name = gets.chomp
        puts "Please input the person's age"
        age = gets.chomp
        person = Person(name, age)
        @people.push(person)
        puts ""

    def create_book
        puts "please input Book's Title"
        title = gets.chomp
        puts "Input the Book's Author"
        author = gets.chomp
        book = Book(title, author)
        @books.push

    def create_rental
        puts ""


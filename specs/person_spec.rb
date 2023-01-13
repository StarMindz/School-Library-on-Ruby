require_relative './../person'
require_relative './../rental'
require_relative './../student'
require_relative './../book'

describe Student do
  before :each do
    @person = Person.new(20, 'Stanley')
  end

  context 'New Object' do
    it 'Create a new Student object' do
      @person.should(be_an_instance_of(Person))
    end

    it 'throws an argument error when no parameter is given' do
      -> { Person.new }.should raise_error ArgumentError
    end
  end

  context 'Object parameters and and methods' do
    it 'returns the person age' do
      @person.age.should eql 20
    end

    it 'returns the person name' do
      @person.correct_name.should eql 'Stanley'
    end

    it 'returns the person name' do
      @person.name.should eql 'Stanley'
    end

    it 'add rentals and confirm that rentals has been added' do
      @new_student = Student.new('SS3', 20, 'Stanley Nnamani', true)
      @new_book = Book.new('Romeo and Juliet', 'William')
      @rental = Rental.new(@new_student, @new_book, '12-12-2015')
      @person.add_rentals(@rental)
      @person.rentals[0].should(be_an_instance_of(Rental))
    end

    it 'can_use_services? method should perform as expected' do
      @person.can_use_services?.should eql true
    end
  end
end

require_relative './../student'
require_relative './../classroom'

describe Student do
  before :each do
    @student = Student.new('SS3', 20, 'Stanley', true)
  end

  context 'New Object' do
    it 'Create a new Student object' do
      @student.should(be_an_instance_of(Student))
    end

    it 'throws an argument error when parameters are less than or greater than expected' do
      -> { Student.new 'Stanley' }.should raise_error ArgumentError
    end

    it 'throws an argument error when no parameter is given' do
      -> { Student.new }.should raise_error ArgumentError
    end
  end

  context 'Object parameters and and methods' do
    it 'returns the student classroom' do
      @student.classroom.should eql 'SS3'
    end

    it 'returns the student age' do
      @student.age.should eql 20
    end

    it 'returns the student name' do
      @student.name.should eql 'Stanley'
    end

    it 'add classroom and confirm that classroom has been added' do
      @class = Classroom.new('Math Class')
      @student.add_class(@class)
      @student.classroom.should(be_an_instance_of(Classroom))
    end

    it 'play_hookey method should perform as expected' do
      @student.play_hooky.should eql '¯\(ツ)/¯'
    end
  end
end

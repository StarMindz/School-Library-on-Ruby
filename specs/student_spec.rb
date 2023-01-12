require_relative './../student'

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

  context 'Object parameters' do
    it 'returns the student classroom' do
      @student.classroom.should eql 'SS3'
    end

    it 'returns the student age' do
      @student.age.should eql 20
    end

    it 'returns the student name' do
      @student.name.should eql 'Stanley'
    end
  end
end

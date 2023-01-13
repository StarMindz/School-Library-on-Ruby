require_relative './../classroom'
require_relative './../student'

describe Student do
  before :each do
    @class = Classroom.new('Math Class')
  end

  context 'New Object' do
    it 'Create a new Classroom object' do
      @class.should(be_an_instance_of(Classroom))
    end

    it 'throws an argument error when parameters are less than or greater than expected' do
      -> { Classroom.new('Stanley', 23) }.should raise_error ArgumentError
    end

    it 'throws an argument error when no parameter is given' do
      -> { Classroom.new }.should raise_error ArgumentError
    end
  end

  context 'Object parameters' do
    it 'returns the class label' do
      @class.label.should eql 'Math Class'
    end

    it 'classroom student list should be empty initially' do
      expect(@class.students.length).to eql 0
    end

    it 'classroom student list should increasse when a student object has been added' do
      @student = Student.new('SS3', 20, 'Stanley', true)
      @class.add_student(@student)
      expect(@class.students.length).to eql 1
    end
  end
end

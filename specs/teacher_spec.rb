require_relative './../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('Math', 40, 'Shehu')
  end

  context 'New Object' do
    it 'Create a new Teacher object' do
      @teacher.should(be_an_instance_of(Teacher))
    end

    it 'throws an argument error when parameters are less than or greater than expected' do
      -> { Teacher.new 'Shehu' }.should raise_error ArgumentError
    end

    it 'throws an argument error when no parameter is given' do
      -> { Teacher.new }.should raise_error ArgumentError
    end
  end

  context 'Object parameters' do
    it 'returns the teachers specialization' do
      @teacher.specialization.should eql 'Math'
    end

    it 'returns the teacher age' do
      @teacher.age.should eql 40
    end

    it 'returns the teacher name' do
      @teacher.name.should eql 'Shehu'
    end

    it 'can_use_services? method should perform as expected' do
      @teacher.can_use_services?.should eql true
    end
  end
end

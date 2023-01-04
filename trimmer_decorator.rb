require_relative './base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    length = @nameable.correct_name.length
    if length <= 10
      @nameable.correct_name
    else
      @nameable.correct_name[0..10]
    end
  end
end

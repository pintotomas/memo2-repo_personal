class Chopper
  def chop(position, array)
    number_position = array.index(position)
    return number_position if number_position

    -1
  end

  def sum(num_array)
    return 'vacio' if num_array.empty?

    text_representation_of_numbers = { '1' => 'uno', '4' => 'cuatro',
                                       '8' => 'ocho', '9' => 'nueve' }
    sum = num_array.inject(:+)
    sum_array = sum.to_s.split('')
    sum_string = []
    return 'demasiado grande' if sum_array.length > 2

    sum_array.each do |num|
      string_interpretation = text_representation_of_numbers[num]
      puts string_interpretation
      sum_string << string_interpretation
    end
    sum_string.join(',')
  end
end

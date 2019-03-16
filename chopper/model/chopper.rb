class Chopper
  def chop(position, array)
    number_position = array.index(position)
    return number_position if number_position

    -1
  end

  def sum(num_array)
    return 'vacio' if num_array.empty?

    sum = num_array.inject(:+)
    NumToString.convert(sum)
  end
end

class NumToString
  def self.convert(number)
    text_representation_of_numbers = { 1 => 'uno', 4 => 'cuatro' }
    text_representation_of_numbers[number]
  end
end

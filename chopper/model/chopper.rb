class Chopper
  def chop(position, array)
    number_position = array.index(position)
    return number_position if number_position

    -1
  end

  def sum(num_array)
    return 'vacio' if num_array.empty?

    'uno'
  end
end

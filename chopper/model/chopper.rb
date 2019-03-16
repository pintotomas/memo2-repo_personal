class Chopper
  def chop(position, array)
    number_position = array.index(position)
    return number_position if number_position

    -1
  end

  def sum(_num_array)
    'vacio'
  end
end

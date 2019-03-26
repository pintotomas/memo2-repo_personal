class OutputAdapter
  def present
    raise NotImplementedError
  end
end

class ConsoleAdapter < OutputAdapter
  def present(message)
    puts message
  end
end

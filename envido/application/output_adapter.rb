class OutputAdapter
  def present
    raise NotImplementedError
  end
end

class ConsoleOutputAdapter < OutputAdapter
  def present(message)
    puts message
  end
end

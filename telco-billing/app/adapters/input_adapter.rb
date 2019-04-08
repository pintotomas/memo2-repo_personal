require 'json'
class InputAdapter
  def interpret_call(_input)
    raise SubclassResponsibility
  end
end

class JSONInputAdapter < InputAdapter
  def interpret_call(input)
    # receives a string with JSON format
    # returns a list with start and end time of a call, as strings
    input_parsed = JSON.parse(input)
    input_parsed
  end
end

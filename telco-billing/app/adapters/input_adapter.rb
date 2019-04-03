require 'json'

class InputAdapter
  def interpret_call(_input)
    raise SubclassResponsibility
  end
end

class JSONInputAdapter < InputAdapter
  @call_param1 = 'fechahora_inicio'
  @call_param2 = 'fechahora_fin'

  def interpret_call(request)
    # receives a string with JSON format
    # returns a list with start and end time of a call, as strings
    input = JSON.parse(request.body.read)
    call_info = [input[@call_param1], input[@call_param2]]
    call_info
  end
end

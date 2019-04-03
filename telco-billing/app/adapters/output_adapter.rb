require 'json'

class OutputAdapter
  def present_call_cost
    raise SubclassResponsibility
  end
end

class JSONOutputAdapter < OutputAdapter
  def present_call_cost(cost)
    { costo_llamada: cost }.to_json
  end
end

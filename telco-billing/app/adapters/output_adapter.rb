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

  def present_bill(billing_information)
    { cantidad_llamadas: billing_information[0], costo_total: billing_information[1] }.to_json
  end
end

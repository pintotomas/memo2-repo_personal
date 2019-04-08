require 'sinatra'
require_relative 'model/telco'
require_relative 'adapters/input_adapter'
require_relative 'adapters/output_adapter'
telco = Telco.new
input_adapter = JSONInputAdapter.new
output_adapter = JSONOutputAdapter.new

post '/llamadas' do
  input = request.body.read
  call_info = input_adapter.interpret_call(input)
  call_cost = telco.call_cost(call_info)
  output = output_adapter.present_call_cost(call_cost)
  status 201
  output
end

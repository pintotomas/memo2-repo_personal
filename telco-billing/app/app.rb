require 'sinatra'
require 'json'
require_relative 'model'
require_relative 'adapters'
telco = Telco.new
input_adapter = JSONInputAdapter.new
output_adapter = JSONOutputAdapter.new

post '/llamadas' do
  input = JSON.parse(request.body.read)
  call_info = input_adapter.interpret_call(input)
  call_start_time = 0
  call_end_time = 1
  call = Call.new(call_info[call_start_time], call_info[call_end_time])
  call_cost = telco.call_cost(call)
  output = output_adapter.present_call_cost(call_cost)
  status 201
  output
end

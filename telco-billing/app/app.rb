require 'sinatra'
require 'json'
require_relative 'model/telco'
require_relative 'model/call/national_call'
require_relative 'adapters/input_adapter'
require_relative 'adapters/output_adapter'
telco = Telco.new
input_adapter = JSONInputAdapter.new
output_adapter = JSONOutputAdapter.new

post '/llamadas' do
  input = JSON.parse(request.body.read)
  call_info = input_adapter.interpret_call(input)
  call_start_time = 0
  call_end_time = 1
  call = NationalCall.new(call_info[call_start_time], call_info[call_end_time])
  call_cost = telco.call_cost(call)
  output = output_adapter.present_call_cost(call_cost)
  status 201
  output
end

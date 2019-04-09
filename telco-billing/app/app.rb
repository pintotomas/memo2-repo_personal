require 'sinatra'
require_relative 'model/telco'
require_relative 'adapters/input_adapter'
require_relative 'adapters/output_adapter'
require 'json'
telco = Telco.new
input_adapter = JSONInputAdapter.new
output_adapter = JSONOutputAdapter.new

post '/llamadas' do
  input = request.body.read
  call_input = input_adapter.interpret_call(input)
  call_cost = telco.call_cost(call_input)
  output = output_adapter.present_call_cost(call_cost)
  status 201
  output
end

post '/reset' do
  telco = Telco.new
  status 200
  { 'reset' => true }.to_json
end

get '/facturacion' do
  billing_input = input_adapter.interpret_billing(params)
  billing_information = telco.bill(billing_input)
  output = output_adapter.present_bill(billing_information)
  status 200
  output
end

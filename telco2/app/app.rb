require 'sinatra'
require 'json'
require_relative 'model/phones_organizer'
require_relative 'model/billing'
require_relative 'helpers/call_parser'
require_relative 'helpers/billing_parser'
require_relative 'helpers/errors/request_input_error'
require_relative 'helpers/plans_parser'
require_relative 'model/errors/call_error'

set :environment, :production

phone_organizer = PhonesOrganizer.new
billing = Billing.new(phone_organizer)

put '/numero' do
  conten_type :json

  input = JSON.parse(request.body.read)
  parser = PlansParser.new(input)
  old_plan = parser.actual_plan(phone_organizer)
  parser.register_new_plan(phone_organizer)
  actual_plan = parser.actual_plan(phone_organizer)
  status 201
  { numero: input['numero'], plan_actual: actual_plan, plan_anterior: old_plan }
end

post '/llamadas' do
  content_type :json

  parser = CallParser.new

  input = JSON.parse(request.body.read)
  cost = parser.new_call(phone_organizer, input)

  status 201
  { costo_llamada: cost }.to_json
end

get '/facturacion' do
  content_type :json

  parser = BillingParser.new
  parser.parse(params)

  total_price = billing.calculate_price(parser.number, parser.month)
  call_quantity = billing.call_quantity(parser.number, parser.month)

  { cantidad_llamadas: call_quantity, costo_total: total_price }.to_json
end

post '/reset' do
  phone_organizer.reset
end

error RequestInputError do |error|
  status 400

  { error: error }.to_json
end

error CallError do |error|
  status 400

  { error: error }.to_json
end

require 'rspec'
require_relative '../app/model/hour_handler'
require 'date'

describe 'HourHandler' do
  let(:hour_handler) { HourHandler.new }

  it 'call in central hour should return central hour cost' do
    start_date_time = DateTime.new(2019, 3, 11, 14)
    end_date_time = DateTime.new(2019, 3, 11, 14, 1)

    hour_cost = hour_handler.create_hour(start_date_time, end_date_time)
    expect(hour_cost.cost_per_minute).to eq 3.2
  end

  it 'call in regular hour should return regular hour cost' do
    start_date_time = DateTime.new(2019, 3, 11, 20)
    end_date_time = DateTime.new(2019, 3, 11, 20, 1)

    hour_cost = hour_handler.create_hour(start_date_time, end_date_time)
    expect(hour_cost.cost_per_minute).to eq 1.8
  end

  it 'call in weekend hour should return weekend hour cost' do
    start_date_time = DateTime.new(2019, 3, 10, 17)
    end_date_time = DateTime.new(2019, 3, 10, 17, 1)

    hour_cost = hour_handler.create_hour(start_date_time, end_date_time)
    expect(hour_cost.cost_per_minute).to eq 2.1
  end
end

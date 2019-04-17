require 'rspec'
require_relative '../app/model/central_hour_cost'
require 'date'

describe 'CentralHour' do
  context 'when call is all in central hour' do
    it 'call lasts one minute total cost should be 3.2' do
      start_date_time = DateTime.new(2019, 3, 11, 14)
      end_date_time = DateTime.new(2019, 3, 11, 14, 1)

      central_hour = CentralHourCost.new(start_date_time, end_date_time)
      expect(central_hour.cost).to eq 3.2
    end

    it 'call lasts two minutes total cost should be 6.4' do
      start_date_time = DateTime.new(2019, 3, 11, 14)
      end_date_time = DateTime.new(2019, 3, 11, 14, 2)

      central_hour = CentralHourCost.new(start_date_time, end_date_time)
      expect(central_hour.cost).to eq 6.4
    end
  end

  context 'when call is part in central hour and part in regular hour' do
    it 'one minute in each hour band total cost call should be 5' do
      start_date_time = DateTime.new(2019, 3, 11, 19, 59)
      end_date_time = DateTime.new(2019, 3, 11, 20, 1)

      central_hour = CentralHourCost.new(start_date_time, end_date_time)
      expect(central_hour.cost).to eq 5
    end

    it 'call that lasts 12 hours, changing the day, should be 1380' do
      start_date_time = DateTime.new(2019, 3, 27, 19)
      end_date_time = DateTime.new(2019, 3, 28, 7)

      central_hour = CentralHourCost.new(start_date_time, end_date_time)
      expect(central_hour.cost).to eq 1380
    end
  end
end

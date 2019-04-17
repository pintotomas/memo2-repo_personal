require 'rspec'
require_relative '../app/model/weekend_hour_cost'
require 'date'

describe 'WeekendHour' do
  context 'when call is all in weekend hour' do
    it 'call lasts one minute total cost should be 2.1' do
      start_date_time = DateTime.new(2019, 3, 10, 21)
      end_date_time = DateTime.new(2019, 3, 10, 21, 1)

      weekend_hour = WeekendHourCost.new(start_date_time, end_date_time)
      expect(weekend_hour.cost).to eq 2.1
    end

    it 'call lasts two hours total cost should be 252' do
      start_date_time = DateTime.new(2019, 3, 10, 14)
      end_date_time = DateTime.new(2019, 3, 10, 16)

      weekend_hour = WeekendHourCost.new(start_date_time, end_date_time)
      expect(weekend_hour.cost).to eq 252
    end
  end

  context 'when call is part in weekend hour and part in regular hour' do
    it 'call lasts one minute in each band total cost should be 3.9' do
      start_date_time = DateTime.new(2019, 3, 10, 23, 59)
      end_date_time = DateTime.new(2019, 3, 11, 0, 1)

      weekend_hour = WeekendHourCost.new(start_date_time, end_date_time)
      expect(weekend_hour.cost - 3.9).to be < 0.001
    end

    it 'call lasts one hour in each band total cost should be 234' do
      start_date_time = DateTime.new(2019, 3, 10, 23, 59)
      end_date_time = DateTime.new(2019, 3, 11, 0, 1)

      weekend_hour = WeekendHourCost.new(start_date_time, end_date_time)
      expect(weekend_hour.cost - 234).to be < 0.001
    end
  end
end

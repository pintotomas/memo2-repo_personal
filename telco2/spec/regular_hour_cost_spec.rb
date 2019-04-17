require 'rspec'
require_relative '../app/model/regular_hour_cost'
require 'date'

describe 'RegularHour' do
  context 'when call is all in regular hour' do
    it 'call lasts one minute total cost should be 1.8' do
      start_date_time = DateTime.new(2019, 3, 11, 21)
      end_date_time = DateTime.new(2019, 3, 11, 21, 1)

      regular_hour = RegularHourCost.new(start_date_time, end_date_time)
      expect(regular_hour.cost).to eq 1.8
    end

    it 'call lasts two minutes total cost should be 3.6' do
      start_date_time = DateTime.new(2019, 3, 11, 22)
      end_date_time = DateTime.new(2019, 3, 11, 22, 2)

      regular_hour = RegularHourCost.new(start_date_time, end_date_time)
      expect(regular_hour.cost).to eq 3.6
    end
  end

  context 'when call is part in regular hour and part in central hour' do
    it 'one minute in each hour band total cost call should be 5' do
      start_date_time = DateTime.new(2019, 3, 11, 7, 59)
      end_date_time = DateTime.new(2019, 3, 11, 8, 1)

      regular_hour = RegularHourCost.new(start_date_time, end_date_time)
      expect(regular_hour.cost).to eq 5
    end

    it 'call that lasts 12 hours should be 2220' do
      start_date_time = DateTime.new(2019, 3, 26, 7)
      end_date_time = DateTime.new(2019, 3, 26, 19)

      regular_hour = RegularHourCost.new(start_date_time, end_date_time)
      expect(regular_hour.cost).to eq 2220
    end
  end

  context 'when call is part in regular hour and part in weekend hour' do
    it 'one minute in each hour band total cost call should be 3.9' do
      start_date_time = DateTime.new(2019, 4, 5, 23, 59)
      end_date_time = DateTime.new(2019, 4, 6, 0, 1)

      regular_hour = RegularHourCost.new(start_date_time, end_date_time)
      expect(regular_hour.cost - 3.9).to be < 0.001
    end
  end
end

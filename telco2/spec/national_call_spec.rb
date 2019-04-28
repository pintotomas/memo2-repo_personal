require 'rspec'
require_relative '../app/model/national_call'
require 'date'

describe 'NationalCall' do
  phone_number_destiny = PhoneNumber.new('5431455786690')

  context 'when call last less than 5 minutes' do
    it 'cost of the call that lasts a minute should be 20' do
      start_date_time = DateTime.new(2019, 3, 11, 20)
      end_date_time = DateTime.new(2019, 3, 11, 20, 1)

      call = NationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 20
    end

    it 'cost of the call that lasts five minutes should be 20' do
      start_date_time = DateTime.new(2019, 3, 11, 20)
      end_date_time = DateTime.new(2019, 3, 11, 20, 5)

      call = NationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 20
    end
  end

  context 'when call last more than 5 minutes' do
    it 'cost of the call that lasts six minutes should be 21.5' do
      start_date_time = DateTime.new(2019, 3, 11, 23)
      end_date_time = DateTime.new(2019, 3, 11, 23, 6)

      call = NationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 21.5
    end

    it 'cost of the call that lasts sixty minutes should be 102.5' do
      start_date_time = DateTime.new(2019, 3, 11, 23)
      end_date_time = DateTime.new(2019, 3, 12, 0)

      call = NationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 102.5
    end
  end
end

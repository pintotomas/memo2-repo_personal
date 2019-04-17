require 'rspec'
require_relative '../app/model/international_call'
require 'date'

describe 'InternationalCall' do
  context 'when call is to north america' do
    phone_number_destiny = PhoneNumber.new('5201122223333')

    it 'cost of a call that lasts one minute should be 10' do
      start_date_time = DateTime.new(2019, 2, 10, 18)
      end_date_time = DateTime.new(2019, 2, 10, 18, 1)

      call = InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 10
    end

    it 'cost of a call that lasts ten minutes should be 100' do
      start_date_time = DateTime.new(2019, 2, 10, 18)
      end_date_time = DateTime.new(2019, 2, 10, 18, 10)

      call = InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 100
    end
  end

  context 'when call is to rest of america' do
    phone_number_destiny = PhoneNumber.new('5501190187236')

    it 'cost of a call that lasts one minute should be 6' do
      start_date_time = DateTime.new(2019, 2, 10, 18)
      end_date_time = DateTime.new(2019, 2, 10, 18, 1)

      call = InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 6
    end

    it 'cost of a call that lasts five minutes should be 30' do
      start_date_time = DateTime.new(2019, 2, 10, 10)
      end_date_time = DateTime.new(2019, 2, 10, 10, 5)

      call = InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 30
    end
  end

  context 'when call is to rest of the world' do
    phone_number_destiny = PhoneNumber.new('3901100559922')

    it 'cost of a call that lasts one minute should be 15' do
      start_date_time = DateTime.new(2019, 1, 10, 9)
      end_date_time = DateTime.new(2019, 1, 10, 9, 1)

      call = InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 15
    end
  end
end

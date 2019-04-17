require 'rspec'
require_relative '../app/model/international_call'
require 'date'
require 'byebug'
describe 'InternationalCall' do
  context 'when call is to north america' do
    phone_number_destiny = PhoneNumber.new('5201122223333')

    it 'cost of a call that lasts one minute should be 10 (week day)' do
      start_date_time = DateTime.new(2019, 2, 11, 18)
      end_date_time = DateTime.new(2019, 2, 11, 18, 1)

      call = InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 10
    end

    it 'cost of a call that lasts ten minutes should be 100 (week day)' do
      start_date_time = DateTime.new(2019, 2, 11, 18)
      end_date_time = DateTime.new(2019, 2, 11, 18, 10)

      call = InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 100
    end

    it 'cost of a call that lasts one minute should be 5 (weekend)' do
      start_date_time = DateTime.new(2019, 2, 10, 18)
      end_date_time = DateTime.new(2019, 2, 10, 18, 1)

      call = InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 5
    end
    it 'cost of a call that lasts ten minutes should be 50 (weekend)' do
      start_date_time = DateTime.new(2019, 2, 10, 18)
      end_date_time = DateTime.new(2019, 2, 10, 18, 10)

      call = InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 50
    end
    #    it 'cost of a call of two minutes, starts on weekend and ends on weekday should be 15' do
    #      start_date_time = DateTime.new(2019, 2, 10, 23, 59)
    #      end_date_time = DateTime.new(2019, 2, 11, 0, 1)
    #      call = InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
    #      expect(call.cost).to eq 15
    #    end
  end

  context 'when call is to rest of america' do
    phone_number_destiny = PhoneNumber.new('5501190187236')

    it 'cost of a call that lasts one minute should be 6 (week day)' do
      start_date_time = DateTime.new(2019, 2, 11, 18)
      end_date_time = DateTime.new(2019, 2, 11, 18, 1)

      call = InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 6
    end

    it 'cost of a call that lasts five minutes should be 30 (week day)' do
      start_date_time = DateTime.new(2019, 2, 11, 10)
      end_date_time = DateTime.new(2019, 2, 11, 10, 5)

      call = InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 30
    end
    it 'cost of a call that lasts one minute should be 3 (weekend)' do
      start_date_time = DateTime.new(2019, 2, 10, 18)
      end_date_time = DateTime.new(2019, 2, 10, 18, 1)

      call = InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 3
    end
    it 'cost of a call that lasts ten minutes should be 30 (weekend)' do
      start_date_time = DateTime.new(2019, 2, 10, 18)
      end_date_time = DateTime.new(2019, 2, 10, 18, 10)

      call = InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 30
    end
    #    it 'cost of a call that lasts one minute before week begins (weekend)' do
    #      start_date_time = DateTime.new(2019, 2, 10, 23, 59)
    #      end_date_time = DateTime.new(2019, 2, 11, 0, 0)
    #
    #      call = InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
    #      expect(call.cost).to eq 3
    #    end
    it 'cost of a call that lasts one minute after week begins (week day)' do
      start_date_time = DateTime.new(2019, 2, 11, 0, 0)
      end_date_time = DateTime.new(2019, 2, 11, 0, 1)

      call = InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 6
    end

    #    it 'cost of a call that lasts two minutes should be 9 (from sunday to monday)' do
    #      start_date_time = DateTime.new(2019, 2, 10, 23, 59)
    #      end_date_time = DateTime.new(2019, 2, 11, 0, 1)
    #
    #      call = InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
    #      expect(call.cost).to eq 9
    #    end
  end

  context 'when call is to rest of the world' do
    phone_number_destiny = PhoneNumber.new('3901100559922')

    it 'cost of a call that lasts one minute should be 15 (week day)' do
      start_date_time = DateTime.new(2019, 1, 11, 9)
      end_date_time = DateTime.new(2019, 1, 11, 9, 1)

      call = InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 15
    end
    it 'cost of a call that lasts two minutes should be 15 (weekend)' do
      start_date_time = DateTime.new(2019, 2, 10, 9)
      end_date_time = DateTime.new(2019, 2, 10, 9, 2)

      call = InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 15
    end
  end
end

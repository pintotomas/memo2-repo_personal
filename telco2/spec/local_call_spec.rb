require 'rspec'
require_relative '../app/model/local_call'
require 'date'

describe 'LocalCall' do
  phone_number_destiny = PhoneNumber.new('5401198764321')

  context 'when call is during central hour in week day (8 to 20)' do
    it 'cost of a call that lasts a minute should be 3.2' do
      start_date_time = DateTime.new(2019, 3, 11, 14)
      end_date_time = DateTime.new(2019, 3, 11, 14, 1)

      call = LocalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 3.2
    end

    it 'cost of a call that lasts two minutes should be 6.4' do
      start_date_time = DateTime.new(2019, 3, 11, 14)
      end_date_time = DateTime.new(2019, 3, 11, 14, 2)

      call = LocalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 6.4
    end

    it 'cost of a call that lasts ten minutes should be 32' do
      start_date_time = DateTime.new(2019, 3, 11, 14)
      end_date_time = DateTime.new(2019, 3, 11, 14, 10)

      call = LocalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 32
    end
  end

  context 'when call is not in central hour in week day (20 to 8)' do
    it 'cost of a call that lasts a minute should be 1.8' do
      start_date_time = DateTime.new(2019, 3, 11, 20)
      end_date_time = DateTime.new(2019, 3, 11, 20, 1)

      call = LocalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 1.8
    end

    it 'cost of a call that lasts two minutes should be 3.6' do
      start_date_time = DateTime.new(2019, 3, 11, 20)
      end_date_time = DateTime.new(2019, 3, 11, 20, 2)

      call = LocalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 3.6
    end

    it 'cost of a call that lasts ten minutes should be 18' do
      start_date_time = DateTime.new(2019, 3, 11, 20)
      end_date_time = DateTime.new(2019, 3, 11, 20, 10)

      call = LocalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 18
    end
  end

  context 'when call is during weekend' do
    it 'cost of a call that lasts a minute during weekend should be 2.1' do
      start_date_time = DateTime.new(2019, 3, 16, 19)
      end_date_time = DateTime.new(2019, 3, 16, 19, 1)

      call = LocalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 2.1
    end

    it 'cost of a call that lasts sixty minutes during weekend should be 126' do
      start_date_time = DateTime.new(2019, 3, 16, 21)
      end_date_time = DateTime.new(2019, 3, 16, 22)

      call = LocalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 126
    end
  end

  context 'when call is part in central hours and part in regular hours' do
    it 'cost of call that lasts one minute in each hour band should be 5' do
      start_date_time = DateTime.new(2019, 3, 20, 19, 59)
      end_date_time = DateTime.new(2019, 3, 20, 20, 1)

      call = LocalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 5
    end

    it 'cost of call that lasts ten minutes in each hour band should be 50' do
      start_date_time = DateTime.new(2019, 3, 20, 7, 50)
      end_date_time = DateTime.new(2019, 3, 20, 8, 10)

      call = LocalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost).to eq 50
    end
  end

  context 'when call is part in week day and part in weekend day' do
    it 'cost of call that lasts one minute in each day should be 3.9' do
      start_date_time = DateTime.new(2019, 4, 5, 23, 59)
      end_date_time = DateTime.new(2019, 4, 6, 0, 1)

      call = LocalCall.new(phone_number_destiny, start_date_time, end_date_time)
      expect(call.cost - 3.9).to be < 0.001
    end
  end
end

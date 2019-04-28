require 'rspec'
require_relative '../app/model/phone_number'
require_relative '../app/model/errors/phone_destiny_same_phone_origin_error'
require_relative '../app/model/errors/call_end_before_start_error'
require 'date'

describe 'PhoneNumber' do
  context 'when call is local' do
    phone_number_origin = PhoneNumber.new('5401112345678')
    phone_number_destiny = PhoneNumber.new('5401198764321')

    it 'cost of a call that lasts a minute in central hours should be 3.2' do
      start_date_time = DateTime.new(2019, 3, 11, 14)
      end_date_time = DateTime.new(2019, 3, 11, 14, 1)

      expect(phone_number_origin.make_call(phone_number_destiny,
                                           start_date_time, end_date_time)).to eq 3.2
    end

    it 'cost of a call that lasts two minutes should be 6.4' do
      start_date_time = DateTime.new(2019, 3, 11, 14)
      end_date_time = DateTime.new(2019, 3, 11, 14, 2)

      expect(phone_number_origin.make_call(phone_number_destiny,
                                           start_date_time, end_date_time)).to eq 6.4
    end

    it 'cost of a call that lasts sixty minutes should be 192' do
      start_date_time = DateTime.new(2019, 3, 11, 14)
      end_date_time = DateTime.new(2019, 3, 11, 15)

      expect(phone_number_origin.make_call(phone_number_destiny,
                                           start_date_time, end_date_time)).to eq 192
    end

    it 'cost of a call that lasts a minute during weekend should be 2.1' do
      start_date_time = DateTime.new(2019, 3, 16, 19)
      end_date_time = DateTime.new(2019, 3, 16, 19, 1)

      expect(phone_number_origin.make_call(phone_number_destiny,
                                           start_date_time, end_date_time)).to eq 2.1
    end

    it 'cost of a call that lasts ten minutes during weekend should be 21' do
      start_date_time = DateTime.new(2019, 3, 16, 17)
      end_date_time = DateTime.new(2019, 3, 16, 17, 10)

      expect(phone_number_origin.make_call(phone_number_destiny,
                                           start_date_time, end_date_time)).to eq 21
    end

    it 'cost of a call that lasts five minutes in each hour band during week should be 25' do
      start_date_time = DateTime.new(2019, 3, 21, 19, 55)
      end_date_time = DateTime.new(2019, 3, 21, 20, 5)

      expect(phone_number_origin.make_call(phone_number_destiny,
                                           start_date_time, end_date_time)).to eq 25
    end
  end

  context 'when call is national' do
    phone_number_origin = PhoneNumber.new('5401112345678')
    phone_number_destiny = PhoneNumber.new('5431498764321')

    it 'cost of a call that lasts a minute should be 20' do
      start_date_time = DateTime.new(2019, 3, 11, 14)
      end_date_time = DateTime.new(2019, 3, 11, 14, 1)

      expect(phone_number_origin.make_call(phone_number_destiny,
                                           start_date_time, end_date_time)).to eq 20
    end

    it 'cost of a call that lasts five minutes should be 20' do
      start_date_time = DateTime.new(2019, 3, 11, 15)
      end_date_time = DateTime.new(2019, 3, 11, 15, 5)

      expect(phone_number_origin.make_call(phone_number_destiny,
                                           start_date_time, end_date_time)).to eq 20
    end

    it 'cost of a call that lasts ten minutes should be 27.5' do
      start_date_time = DateTime.new(2019, 3, 11, 22)
      end_date_time = DateTime.new(2019, 3, 11, 22, 10)

      expect(phone_number_origin.make_call(phone_number_destiny,
                                           start_date_time, end_date_time)).to eq 27.5
    end
  end

  context 'when call is international' do
    phone_number_origin = PhoneNumber.new('5401112345678')

    it 'cost of a call to north america that last a minute should be 10' do
      phone_number_destiny = PhoneNumber.new('5201122223333')
      start_date_time = DateTime.new(2019, 4, 5, 16)
      end_date_time = DateTime.new(2019, 4, 5, 16, 1)

      expect(phone_number_origin.make_call(phone_number_destiny,
                                           start_date_time, end_date_time)).to eq 10
    end

    it 'cost of a call to rest america that last a minute should be 6' do
      phone_number_destiny = PhoneNumber.new('5501122993388')
      start_date_time = DateTime.new(2019, 3, 5, 7)
      end_date_time = DateTime.new(2019, 3, 5, 7, 1)

      expect(phone_number_origin.make_call(phone_number_destiny,
                                           start_date_time, end_date_time)).to eq 6
    end

    it 'cost of a call to rest world that last a minute should be 15' do
      phone_number_destiny = PhoneNumber.new('3901133886644')
      start_date_time = DateTime.new(2019, 3, 12, 4)
      end_date_time = DateTime.new(2019, 3, 12, 4, 1)

      expect(phone_number_origin.make_call(phone_number_destiny,
                                           start_date_time, end_date_time)).to eq 15
    end
  end

  context 'when call is not valid' do
    phone_number_origin = PhoneNumber.new('5401112345678')
    start_date_time = DateTime.new(2019, 3, 12, 4)
    end_date_time = DateTime.new(2019, 3, 12, 4, 1)
    phone_number_destiny = PhoneNumber.new('5201122223333')

    it 'should raise destiny same as origin error' do
      expect do
        phone_number_origin.make_call(phone_number_origin, start_date_time,
                                      end_date_time)
      end .to raise_error(PhoneDestinySamePhoneOriginError)
    end

    it 'should raise end before start error' do
      end_date_time_before = DateTime.new(2019, 3, 12, 3, 1)

      expect do
        phone_number_origin.make_call(phone_number_destiny, start_date_time,
                                      end_date_time_before)
      end .to raise_error(CallEndBeforeStartError)
    end
  end
end

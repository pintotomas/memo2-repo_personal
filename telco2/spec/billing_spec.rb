require 'rspec'
require_relative '../app/model/billing'
require_relative '../app/model/phones_organizer'

describe 'Billing' do
  let(:phone_organizer) { PhonesOrganizer.new }
  let(:billing) { Billing.new(phone_organizer) }

  month = '201901'
  number = '5401143095687'

  context 'when a number has no calls in the month' do
    it 'price of bill should be 100' do
      expect(billing.calculate_price(number, month)).to eq 100
    end

    it 'call quantity of bill should be 100' do
      expect(billing.call_quantity(number, month)).to eq 0
    end
  end

  context 'when a number has one local call of a minute in the month' do
    it 'price of bill should be 103.2' do
      phone_number_origin = phone_organizer.find_or_create_phone(number)
      phone_number_destiny = phone_organizer.find_or_create_phone('5401168158752')

      phone_number_origin.make_call(phone_number_destiny,
                                    DateTime.new(2019, 1, 1, 10), DateTime.new(2019, 1, 1, 10, 1))

      expect(billing.calculate_price(number, month)).to eq 103.2
    end

    it 'call quantity of bill should be 1' do
      phone_number_origin = phone_organizer.find_or_create_phone(number)
      phone_number_destiny = phone_organizer.find_or_create_phone('5401168158752')

      phone_number_origin.make_call(phone_number_destiny,
                                    DateTime.new(2019, 1, 1, 10), DateTime.new(2019, 1, 1, 10, 1))

      expect(billing.call_quantity(number, month)).to eq 1
    end
  end

  context 'when a number has one local call of a minute in another month' do
    another_month = '201904'

    it 'price of bill should be 100' do
      phone_number_origin = phone_organizer.find_or_create_phone(number)
      phone_number_destiny = phone_organizer.find_or_create_phone('5401168158752')

      phone_number_origin.make_call(phone_number_destiny,
                                    DateTime.new(2019, 1, 1, 10), DateTime.new(2019, 1, 1, 10, 1))

      expect(billing.calculate_price(number, another_month)).to eq 100
    end

    it 'call quantity of bill should be 0' do
      phone_number_origin = phone_organizer.find_or_create_phone(number)
      phone_number_destiny = phone_organizer.find_or_create_phone('5401168158752')

      phone_number_origin.make_call(phone_number_destiny,
                                    DateTime.new(2019, 1, 1, 10), DateTime.new(2019, 1, 1, 10, 1))

      expect(billing.call_quantity(number, another_month)).to eq 0
    end
  end
end

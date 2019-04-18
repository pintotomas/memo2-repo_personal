require 'rspec'
require_relative '../app/model/phones_organizer'
describe 'PhoneOrganizer' do
  phone_organizer = PhonesOrganizer.new

  context 'when no plan has been registered' do
    it 'actual plan name' do
      expect(phone_organizer.plan('5491103030404').name).to eq 'ninguno'
    end
  end

  context 'when registering a plan to a phone' do
    it 'actual plan name should be amigos' do
      phone_organizer.register_plan('5491103030404', 'amigos', %w[5401123234242 5401102020303])
      expect(phone_organizer.plan('5491103030404').name).to eq 'amigos'
    end
  end
end

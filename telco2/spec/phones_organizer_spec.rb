require 'rspec'
require_relative '../app/model/phones_organizer'
require_relative '../app/model/errors/only_one_plan_per_phone'
describe 'PhoneOrganizer' do
  phone_organizer = PhonesOrganizer.new

  context 'when no plan has been registered' do
    it 'actual plan name' do
      expect(phone_organizer.actual_plan('5491103030404')).to eq 'ninguno'
    end
  end
end

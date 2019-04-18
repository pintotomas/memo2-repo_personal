require 'rspec'
require_relative '../app/model/phones_organizer'
require_relative '../app/model/errors/only_one_plan_per_phone'

# describe 'PhoneOrganizer' do
#  phone_organizer = PhonesOrganizer.new
#  phone_organizer.register_plan('5401112345678', 'amigos',
#  ['5401134343434', '5401134343435', '5401134343436'])
#  context 'when one plan has been already added' do
#    it 'adding a new plan raises an exception' do
#      expect do
#        phone_organizer.register_plan('5401112345678', 'amigos', 
# ['5401134343437', '5401134343438', '5401134343439'])
#      end.to raise_error(OnlyOnePlanPerPhone)
#
# end

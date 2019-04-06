require 'rspec'
require_relative '../app/model/phone.rb'
describe 'Phone' do
  it 'Creating a new phone with characters should raise exception' do
    expect { Phone.new('12091444455g5') }.to raise_error(PhoneNumberCannotContainCharactersError)
  end
end

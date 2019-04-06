require 'rspec'
require_relative '../app/model/phone.rb'
describe 'Phone' do
  it 'Creating a new phone with characters should raise exception' do
    expect { Phone.new('12091444455g5') }.to raise_error(PhoneNumberCannotContainCharactersError)
  end
  it 'Creating a new phone with 12 digits should raise exception' do
    expect { Phone.new('123456789123') }.to raise_error(PhonesMustBeThirteenDigitsError)
  end
  it 'Creating a new phone with 14 digits should raise exception' do
    expect { Phone.new('12345678912345') }.to raise_error(PhonesMustBeThirteenDigitsError)
  end
  it 'Creating a new phone with invalid country code should raise exception' do
    expect { Phone.new('7911111111111') }.to raise_error(InvalidCountryCodeError)
  end
end

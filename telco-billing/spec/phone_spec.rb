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
  it 'Creating a new phone with invalid area code should raise exception' do
    expect { Phone.new('5411111111111') }.to raise_error(InvalidAreaCodeError)
  end
  it 'Phones with same country code are detected correctly' do
    p1 = Phone.new('54011111111 11')
    p2 = Phone.new('5401111 111112')
    expect(p1.country_code == p2.country_code).to eq true
  end
  it 'Phones with different country code are differentiated correctly' do
    p1 = Phone.new('52011111111 11')
    p2 = Phone.new('54011111 11112')
    expect(p1.country_code == p2.country_code).to eq false
  end
  it 'Phones with same area code are detected correctly' do
    p1 = Phone.new('540 1111111111')
    p2 = Phone.new('5401111 111112')
    expect(p1.area_code == p2.area_code).to eq true
  end
  it 'Phones with different area code are detected correctly' do
    p1 = Phone.new('5401111 111111')
    p2 = Phone.new('5431411111112 ')
    expect(p1.area_code == p2.area_code).to eq false
  end
  it 'Get phone number' do
    p1 = Phone.new('5401111111111')
    expect(p1.phone_number).to eq '5401111111111'
  end
end

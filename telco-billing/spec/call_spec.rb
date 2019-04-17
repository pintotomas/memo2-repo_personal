require 'rspec'
require_relative '../app/model/call/call'
require_relative '../app/model/phone/phone'
describe 'Call' do
  it 'Call with invalid start time format should raise exception' do
    expect { Call.new(Phone.new('5401193949291'), Phone.new('5401193949292'), '', '') }.to raise_error(InvalidCallStartOrEndTimeError)
  end
  it 'Call with start time after end time should raise exception' do
    expect do
      Call.new(Phone.new('5401193949291'), Phone.new('5401193949292'),
               '20190211;14:30', '20190211;14:29')
    end .to raise_error CallEndTimeBeforeStartTimeError
  end
  it 'Call with same origin and destination should raise exception' do
    expect do
      Call.new(Phone.new('5401193949291'),
               Phone.new('5401193949291'), '20190110', '20190111')
    end .to raise_error(PhoneOriginNumberEqualsPhoneDestinationNumberError)
  end
  it 'Call month' do
    expect(Call.new(Phone.new('5401193949291'), Phone.new('5401193949292'), '20190110', '20190111').month).to eq 1
  end
  it 'Call year' do
    expect(Call.new(Phone.new('5401193949291'), Phone.new('5401193949292'), '20190110', '20190111').year).to eq 2019
  end
end

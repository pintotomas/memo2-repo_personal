require 'rspec'
require_relative '../app/model/call'

describe 'Call' do
  it 'Call with invalid start time format should raise exception' do
    expect { Call.new('', '') }.to raise_error(InvalidCallStartOrEndTimeError)
  end
end

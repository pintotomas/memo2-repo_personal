require 'rspec'
require 'date'
require_relative '../app/model/call_register'
require_relative '../app/model/local_call'

describe 'CallRegister' do
  context 'when there was no calls' do
    it 'should not have calls' do
      call_register = CallRegister.new
      month = '201901'

      expect(call_register.has_calls?(month)).to eq false
    end
  end

  context 'when there was one call for a determinate month' do
    let(:call_register) { CallRegister.new }

    phone_number_destiny = PhoneNumber.new('5401144765598')
    month = '201901'
    call = LocalCall.new(phone_number_destiny,
                         DateTime.new(2019, 1, 10, 8), DateTime.new(2019, 1, 10, 9))

    it 'should have calls' do
      call_register.add_call(call)

      expect(call_register.has_calls?(month)).to eq true
    end

    it 'should return a list non empty of calls' do
      call_register.add_call(call)
      calls = call_register.get_month_calls(month)

      expect(calls.empty?).to eq false
      expect(calls[0]).to eq call
    end
  end
end

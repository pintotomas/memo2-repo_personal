require 'rspec'
require_relative '../app/model/call/call_factory'

describe 'CallFactory' do
  let(:callFactory) { CallFactory.new }

  it 'Create a local call' do
    call_info = { 'numero_origen' => '54 011 4444 1111', 'numero_destino' => '54 011 5555 6666',
                  'fechahora_inicio' => '20190211;14:30', 'fechahora_fin' => '20190211;14:31' }
    local_call = callFactory.new_call(call_info)
    expect(local_call.class).to eq LocalCall
  end

  it 'Create a national call' do
    call_info = { 'numero_origen' => '54 011 4444 1111', 'numero_destino' => '54 314 5555 6666',
                  'fechahora_inicio' => '20190211;14:30', 'fechahora_fin' => '20190211;14:31' }
    national_call = callFactory.new_call(call_info)
    expect(national_call.class).to eq NationalCall
  end

  it 'Create a international call' do
    call_info = { 'numero_origen' => '54 011 4444 1111', 'numero_destino' => '55 314 5555 6666',
                  'fechahora_inicio' => '20190211;14:30', 'fechahora_fin' => '20190211;14:31' }
    international_call = callFactory.new_call(call_info)
    expect(international_call.class).to eq InternationalCall
  end
end

require 'rspec'
require_relative '../app/model/telco'
require_relative '../app/model/phone'
require_relative '../app/model/call/local_call'
describe 'Telco' do
  let(:telco) { Telco.new }

  it 'Bill one month with only a local call' do
    telco.call_cost('fechahora_inicio' => '20190211;14:30', 'fechahora_fin' => '20190211;14:31',
                    'numero_origen' => '5401134330438', 'numero_destino' => '5401112345679')
    res = telco.bill('number' => '5401134330438', 'year_month' => '201902')
    calls_made = 1
    total = 3.2
    expect(res).to eq [calls_made, total]
  end
end

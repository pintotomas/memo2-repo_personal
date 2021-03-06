require 'rspec'
require_relative '../app/model/telco'
require_relative '../app/model/phone/phone'
require_relative '../app/model/exceptions/telco_exceptions'
require 'byebug'
def make_call(telco, origin, destination, start_time, end_time)
  telco.register_call('fechahora_inicio' => start_time, 'fechahora_fin' => end_time,
                      'numero_origen' => origin, 'numero_destino' => destination)
  telco.call_cost('fechahora_inicio' => start_time, 'fechahora_fin' => end_time,
                  'numero_origen' => origin, 'numero_destino' => destination)
end

describe 'Telco' do
  let(:telco) { Telco.new }

  base_cost = 100

  it 'Billing with an invalid year' do
    expect { telco.bill('number' => '5401134330438', 'year_month' => '201x02') }.to raise_error(InvalidBillingYear)
  end

  it 'Billing with an invalid month' do
    expect { telco.bill('number' => '5401134330438', 'year_month' => '20190x') }.to raise_error(InvalidBillingMonth)
  end

  it 'Bill one month with only a local call' do
    make_call(telco, '5401134330438', '5401112345679', '20190211;14:30', '20190211;14:31')
    res = telco.bill('number' => '5401134330438', 'year_month' => '201902')
    calls_made = 1
    total = 3.2 + base_cost
    expect(res).to eq [calls_made, total]
  end

  it 'Bill one month with a local call and a national call' do
    make_call(telco, '5401134330438', '5401112345679', '20190211;14:30', '20190211;14:31')
    make_call(telco, '5401134330438', '5431412345679', '20190212;14:30', '20190212;14:31')
    res = telco.bill('number' => '5401134330438', 'year_month' => '201902')
    calls_made = 2
    total = 3.2 + 20 + base_cost
    expect(res).to eq [calls_made, total]
  end

  it 'Bill one month with a local, national and international call' do
    make_call(telco, '5401134330438', '5401112345679', '20190211;14:30', '20190211;14:31')
    make_call(telco, '5401134330438', '5431412345679', '20190212;14:30', '20190212;14:31')
    make_call(telco, '5401134330438', '3931412345679', '20190209;14:30', '20190209;14:31')
    res = telco.bill('number' => '5401134330438', 'year_month' => '201902')
    calls_made = 3
    total = 3.2 + 20 + 15 + base_cost
    expect(res).to eq [calls_made, total]
  end
  it 'Bill ignores local call made on another month' do
    make_call(telco, '5401134330438', '5401112345679', '20190111;14:30', '20190211;14:31')
    make_call(telco, '5401134330438', '5431412345679', '20190212;14:30', '20190212;14:31')
    make_call(telco, '5401134330438', '3931412345679', '20190209;14:30', '20190209;14:31')
    res = telco.bill('number' => '5401134330438', 'year_month' => '201902')
    calls_made = 2
    total = 20 + 15 + base_cost
    expect(res).to eq [calls_made, total]
  end
end

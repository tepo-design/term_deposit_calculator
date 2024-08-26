require './lib/term_deposit_calculator/calculator/maturity_term_deposit_calculator.rb'
require './lib/term_deposit_calculator/calculator/reinvestment_term_deposit_calculator.rb'
require './lib/term_deposit_calculator/calculator/builder.rb'

describe Builder do
  subject(:builder) { described_class.new(maturity_term_deposit_calculator:, reinvestment_term_deposit_calculator:) }

  let(:maturity_term_deposit_calculator) { class_double(MaturityTermDepositCalculator) }
  let(:reinvestment_term_deposit_calculator) { class_double(ReinvestmentTermDepositCalculator) }

  let(:initial_deposit_amount) { 10000 }
  let(:interest_rate) { 15 }
  let(:investment_term) { 3 }
  let(:interest_payment_frequency) { "monthly" }

  let(:maturity_calc_instance) { instance_double(MaturityTermDepositCalculator) }
  let(:reinvestment_calc_instance) { instance_double(ReinvestmentTermDepositCalculator) }

  before do
    allow(maturity_term_deposit_calculator).to receive(:new).and_return(maturity_calc_instance)
    allow(reinvestment_term_deposit_calculator).to receive(:new).and_return(reinvestment_calc_instance)
  end

  context '#get_calculator' do
    subject(:get_calculator) { builder.get_calculator(initial_deposit_amount:, interest_rate:, investment_term:, interest_payment_frequency:) }
    
    context "interest payment frequency is maturity" do
      let(:interest_payment_frequency) { "maturity" }

      it 'returns the maturity calculator' do
        expect(get_calculator).to eq(maturity_calc_instance)
      end
    end

    context "interest payment frequency is NOT maturity" do
      let(:interest_payment_frequency) { "monthly" }

      it 'returns the maturity calculator' do
        expect(get_calculator).to eq(reinvestment_calc_instance)
      end
    end
  end
end

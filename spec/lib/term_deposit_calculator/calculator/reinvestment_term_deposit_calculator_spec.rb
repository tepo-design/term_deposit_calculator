require './lib/term_deposit_calculator/calculator/reinvestment_term_deposit_calculator'
require './lib/term_deposit_calculator/calculator/base_term_deposit_calculator.rb'

describe ReinvestmentTermDepositCalculator do
  subject(:calculator) { described_class.new(
    initial_deposit_amount:,
    interest_rate:,
    investment_term:,
    interest_payment_frequency:
  )}

  let(:initial_deposit_amount) { 10000 }
  let(:interest_rate) { 15 }
  let(:investment_term) { 3 }
  let(:interest_payment_frequency) { "monthly" }

  context '#final balance' do
    context 'for a monthly compounding period' do
      it 'has the expected final balance' do
        expect(subject.final_balance).to eq(15639)
      end
    end

    context 'for a quarterly compounding period' do
      let(:interest_payment_frequency) { "quarterly" }

      it 'has the expected final balance' do
        expect(subject.final_balance).to eq(15555)
      end
    end

    context 'for an annual compounding period' do
      let(:interest_payment_frequency) { "annually" }

      it 'has the expected final balance' do
        expect(subject.final_balance).to eq(15209)
      end
    end
  end

  context '#decimal interest rate' do
    it 'has the expected final balance' do
      expect(subject.decimal_interest_rate).to eq(0.15)
    end
  end
end

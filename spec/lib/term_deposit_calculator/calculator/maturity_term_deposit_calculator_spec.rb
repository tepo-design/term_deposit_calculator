require './lib/term_deposit_calculator/calculator/maturity_term_deposit_calculator'
require './lib/term_deposit_calculator/calculator/base_term_deposit_calculator.rb'

describe MaturityTermDepositCalculator do
  subject(:calculator) { described_class.new(
    initial_deposit_amount:,
    interest_rate:,
    investment_term:,
  )}

  let(:initial_deposit_amount) { 10000 }
  let(:interest_rate) { 15 }
  let(:investment_term) { 3 }

  context '#final balance' do
    it 'has the expected final balance' do
      expect(subject.final_balance).to eq(14500)
    end
  end

  context '#decimal interest rate' do
    it 'has the expected final balance' do
      expect(subject.decimal_interest_rate).to eq(0.15)
    end
  end
end

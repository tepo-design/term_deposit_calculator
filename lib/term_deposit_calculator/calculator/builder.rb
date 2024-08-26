require './lib/term_deposit_calculator/calculator/maturity_term_deposit_calculator.rb'
require './lib/term_deposit_calculator/calculator/reinvestment_term_deposit_calculator.rb'

class Builder
  def initialize(
    maturity_term_deposit_calculator: MaturityTermDepositCalculator,
    reinvestment_term_deposit_calculator: ReinvestmentTermDepositCalculator
  )
    @maturity_term_deposit_calculator = maturity_term_deposit_calculator
    @reinvestment_term_deposit_calculator = reinvestment_term_deposit_calculator
  end

  attr_reader :maturity_term_deposit_calculator, :reinvestment_term_deposit_calculator

  def get_calculator(interest_payment_frequency:, initial_deposit_amount:, interest_rate:, investment_term:)
    case interest_payment_frequency
    when "maturity"
      maturity_term_deposit_calculator.new(initial_deposit_amount:, interest_rate:, investment_term:)
    else
      reinvestment_term_deposit_calculator.new(interest_payment_frequency:, initial_deposit_amount:, interest_rate:, investment_term:)
    end
  end
end

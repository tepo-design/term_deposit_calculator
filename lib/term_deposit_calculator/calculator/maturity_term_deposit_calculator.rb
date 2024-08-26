require './lib/term_deposit_calculator/calculator/base_term_deposit_calculator.rb'

class MaturityTermDepositCalculator
  include BaseTermDepositCalculator
  
  def initialize(initial_deposit_amount:, interest_rate:, investment_term:)
    super(initial_deposit_amount:, interest_rate:)
    @interest_rate = interest_rate
    @investment_term = investment_term
  end

  attr_reader :interest_rate, :investment_term

  private

  def interest_multiplier
    1 + (decimal_interest_rate * investment_term)
  end
end

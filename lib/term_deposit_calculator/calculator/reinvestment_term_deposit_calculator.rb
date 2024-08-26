require './lib/term_deposit_calculator/calculator/base_term_deposit_calculator.rb'

class ReinvestmentTermDepositCalculator
  include BaseTermDepositCalculator

  def initialize(initial_deposit_amount:, interest_rate:, investment_term:, interest_payment_frequency:)
    super(initial_deposit_amount:, interest_rate:)
    @interest_payment_frequency = interest_payment_frequency
    @investment_term = investment_term
    @interest_payment_frequency = interest_payment_frequency
  end

  attr_reader :initial_deposit_amount, :interest_rate, :investment_term, :interest_payment_frequency

  private 
  
  def interest_multiplier
    growth_factor ** (compounding_periods * investment_term)
  end

  def growth_factor
    (1 + decimal_interest_rate / compounding_periods)
  end

  def compounding_periods
    { "monthly" => 12, "quarterly" => 4, "annually" => 1 }[interest_payment_frequency]
  end
end

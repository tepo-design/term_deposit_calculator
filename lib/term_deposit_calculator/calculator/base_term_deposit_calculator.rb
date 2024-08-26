module BaseTermDepositCalculator
  def initialize(initial_deposit_amount:, interest_rate:)
    @initial_deposit_amount = initial_deposit_amount
    @interest_rate = interest_rate
  end

  attr_reader :initial_deposit_amount, :interest_rate

  def final_balance
    (initial_deposit_amount * interest_multiplier).round
  end

  def decimal_interest_rate
    interest_rate / 100.0
  end
end

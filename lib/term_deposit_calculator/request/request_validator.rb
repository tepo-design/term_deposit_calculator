require 'active_model'

class RequestValidator
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :initial_deposit_amount, :interest_rate, :investment_term, :interest_payment_frequency

  validates :initial_deposit_amount, :investment_term, presence: true
  validates :interest_rate, presence: true
  validates :interest_payment_frequency, presence: true, inclusion: { in: %w[monthly quarterly annually maturity] }

  def valid_args
    {
      initial_deposit_amount: initial_deposit_amount,
      interest_rate: interest_rate,
      investment_term: investment_term,
      interest_payment_frequency: interest_payment_frequency
    }
  end
end

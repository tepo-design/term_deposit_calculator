require './lib/term_deposit_calculator/request/request_handler.rb'

class TermDepositCalculator
  def self.run
    request_args = get_user_input

    response = RequestHandler.new(request_args:).handle

    if response[:success]
      puts "Final balance: #{response[:result]}"
    else
      puts "Fix these errors and try again!"
      puts "#{response[:errors]}"
    end
  end

  def self.get_user_input
    puts "Enter initial deposit amount:"
    initial_deposit_amount = float_input

    puts "Enter interest rate:"
    interest_rate = float_input

    puts "Enter investment term (in years):"
    investment_term = integer_input

    puts "Enter interest frequency (monthly, quarterly, annually, maturity):"
    interest_payment_frequency = string_input

    {
      initial_deposit_amount:,
      interest_rate:,
      investment_term:,
      interest_payment_frequency:
    }
  end

  def self.integer_input
    input = gets.chomp

    input.empty? ? nil : input.to_i
  end

  def self.float_input
    input = gets.chomp

    input.empty? ? nil : input.to_f
  end

  def self.string_input
    input = gets.chomp

    input.empty? ? nil : input.downcase
  end
end

TermDepositCalculator.run

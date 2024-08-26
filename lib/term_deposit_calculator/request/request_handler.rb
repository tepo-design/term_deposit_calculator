require './lib/term_deposit_calculator/request/request_validator.rb'
require './lib/term_deposit_calculator/calculator/builder.rb'

class RequestHandler 
  def initialize(
    request_args:,
    request_validator: RequestValidator.new(request_args),
    calculator_builder: Builder.new
  )
    @request_validator = request_validator
    @calculator_builder = calculator_builder
  end

  attr_reader :request_validator, :calculator_builder

  def handle
    if request_validator.valid?
      validated_args = request_validator.valid_args
      calculator = calculator_builder.get_calculator(**validated_args)
      { success: true, result: calculator.final_balance }
    else
      { success: false, errors: request_validator.errors.full_messages }
    end
  end
end

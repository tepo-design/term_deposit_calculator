require './lib/term_deposit_calculator/request/request_handler.rb'
require './lib/term_deposit_calculator/request/request_validator.rb'
require './lib/term_deposit_calculator/calculator/builder.rb'

describe RequestHandler do
  subject(:handler) { described_class.new(request_args:, request_validator:, calculator_builder:)}
  let(:request_validator) { instance_double(RequestValidator) }
  let(:calculator_builder) { instance_double(Builder) }

  let(:request_args) do
    {
      initial_deposit_amount: initial_deposit_amount,
      interest_rate: interest_rate,
      investment_term: investment_term,
      interest_payment_frequency: interest_payment_frequency
    }
  end

  let(:initial_deposit_amount) { 10000 }
  let(:interest_rate) { 15 }
  let(:investment_term) { 3 }
  let(:interest_payment_frequency) { "monthly" }

  let(:calculator) { instance_double(BaseTermDepositCalculator, final_balance:)}
  let(:final_balance) { 100 }

  context 'valid request' do
    before do
      allow(request_validator)
        .to receive(:valid?)
        .and_return(true)

      allow(request_validator)
        .to receive(:valid_args)
        .and_return(request_args)

      allow(calculator_builder)
        .to receive(:get_calculator)
        .and_return(calculator)
    end

    it 'returns the expected response' do
      expect(handler.handle).to eq({ success: true, result: final_balance })
    end
  end

  context 'invalid request' do
    let(:errors) { instance_double(ActiveModel::Errors) }
    let(:error_message) { ["validator-error-message"] }

    before do
      allow(request_validator)
        .to receive(:valid?)
        .and_return(false)
      allow(request_validator)
        .to receive(:errors)
        .and_return(errors)
      allow(errors)
        .to receive(:full_messages)
        .and_return(error_message)
    end

    it 'returns the expected response' do
      expect(handler.handle).to eq({ success: false, errors: error_message })
    end
  end
end

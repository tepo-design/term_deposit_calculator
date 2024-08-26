require './lib/term_deposit_calculator/request/request_validator.rb'

describe RequestValidator do
  let(:validator) do
    described_class.new(
      initial_deposit_amount: initial_deposit_amount,
      interest_rate: interest_rate,
      investment_term: investment_term,
      interest_payment_frequency: interest_payment_frequency
    )
  end

  let(:initial_deposit_amount) { 10000 }
  let(:interest_rate) { 5 }
  let(:investment_term) { 3 }
  let(:interest_payment_frequency) { "monthly" }

  describe '#valid?' do
    context 'when all attributes are valid' do
      it 'is valid' do
        expect(validator).to be_valid
      end
    end

    context 'when initial_deposit_amount is missing' do
      let(:initial_deposit_amount) { nil }
      
      it 'is not valid' do
        expect(validator).not_to be_valid
        expect(validator.errors[:initial_deposit_amount]).to include("can't be blank")
      end
    end

    context 'when interest_rate is missing' do
      let(:interest_rate) { nil }
      
      it 'is not valid' do
        expect(validator).not_to be_valid
        expect(validator.errors[:interest_rate]).to include("can't be blank")
      end
    end

    context 'when investment_term is missing' do
      let(:investment_term) { nil }
      
      it 'is not valid' do
        expect(validator).not_to be_valid
        expect(validator.errors[:investment_term]).to include("can't be blank")
      end
    end

    context 'when interest_payment_frequency is missing' do
      let(:interest_payment_frequency) { nil }
      
      it 'is not valid' do
        expect(validator).not_to be_valid
        expect(validator.errors[:interest_payment_frequency]).to include("can't be blank")
      end
    end

    context 'when interest_payment_frequency is not included in the list' do
      let(:interest_payment_frequency) { "invalid" }
      
      it 'is not valid' do
        expect(validator).not_to be_valid
        expect(validator.errors[:interest_payment_frequency]).to include("is not included in the list")
      end
    end
  end

  describe '#valid_args' do
    let(:expected_valid_args) do
      {
        initial_deposit_amount: initial_deposit_amount,
        interest_rate: interest_rate,
        investment_term: investment_term,
        interest_payment_frequency: interest_payment_frequency
      }
    end

    it 'returns the expected args' do
      expect(validator.valid_args).to eq(expected_valid_args)
    end
  end
end

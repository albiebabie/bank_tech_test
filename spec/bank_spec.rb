require 'bank'

describe Bank do
  let(:bank) { Bank.new }
  let(:error) { 'Invalid request: minimum accepted value and format = 00.01' }

  context 'balance' do
    it 'defaults to a balance of 0' do
      expect(bank.balance).to eq(0)
    end
  end

  context 'deposit' do
    describe 'positive amount' do
      before(:each) do
        bank.deposit(200.00)
      end
      it 'tops up balance' do
        expect(bank.balance).to eq(200.00)
      end
    end

    describe 'negative amount' do
      it 'raises error' do
        expect { bank.deposit(-200.00) }.to raise_error(error)
      end
    end
  end

  context 'withdraw' do
    describe 'positive amount' do
      before(:each) do
        bank.withdraw(200.00)
      end
      it 'reduces balance' do
        expect(bank.balance).to eq(-200.00)
      end
    end
    describe 'negative amount' do
      it 'raises error' do
        expect { bank.withdraw(-200.00) }.to raise_error(error)
      end
    end

  end


end

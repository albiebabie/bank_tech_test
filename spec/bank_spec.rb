require 'bank'

describe Bank do
  let(:bank) { Bank.new }
  let(:error) { 'Invalid request: minimum accepted value and format = 00.01' }
  let(:time) { Time.new }
  context 'balance' do
    it 'defaults to a balance of 0' do
      expect(bank.balance).to eq(0)
    end
  end

  context 'deposit' do
    describe 'valid amount' do
      before(:each) do
        bank.deposit(200.00)
      end
      it 'tops up balance' do
        expect(bank.balance).to eq(200.00)
      end
      it 'updates statement' do
        expect(bank.display_statement).to include(:time => time.inspect,
        :credit => 200.00, :debit => 0.0, :balance => 200.00 )
      end
    end

    describe 'invalid amount' do
      it 'raises error' do
        expect { bank.deposit(-200.00) }.to raise_error(error)
      end
    end
  end

  context 'withdraw' do
    describe 'valid amount' do
      before(:each) do
        bank.withdraw(200.00)
      end
      it 'reduces balance' do
        expect(bank.balance).to eq(-200.00)
      end
      it 'updates statement' do
        expect(bank.display_statement).to include(:time => time.inspect,
        :credit => 0.0, :debit => 200.00, :balance => -200.00 )
      end
    end
    describe 'invalid amount' do
      it 'raises error' do
        expect { bank.withdraw(-200.00) }.to raise_error(error)
      end
    end
  end

  context '#display_transaction_history' do

    describe 'multiple transactions' do
      before(:each) do
        bank.deposit(500)
      end
      it 'can be displayed' do
        expect(bank.display_transaction_history).to include({:time => time.inspect,
        :credit =>  500, :debit => 0.0, :balance => 500.0})
      end
    end

    # describe 'multiple transactions' do
    #   before(:each) do
    #     bank.deposit(500)
    #     bank.withdraw(300)
    #   end
    #   it 'can be displayed' do
    #     expect(bank.display_transaction_history).to include({:time => time.inspect,
    #     :credit =>  500, :debit => 0.0, :balance => 500.0}, {:time => time.inspect,
    #     :credit =>  0.0, :debit => 300, :balance => 200.0})
    #   end
    # end
  end

end

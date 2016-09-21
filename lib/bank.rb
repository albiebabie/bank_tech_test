class Bank

  DEFAULT_BALANCE = 0.0

  attr_reader :balance, :statement, :time, :transaction_history

  def initialize
    @balance = DEFAULT_BALANCE
    @transaction_history = []
    @statement = {}
    @time = Time.new
  end

  def deposit(amount)
    if valid?(amount) == true
      @balance += amount
      credit_update_statement(amount)
      update_transaction_history
    else
      error
    end
  end

  def withdraw(amount)
    if valid?(amount) == true
      @balance -= amount
      debit_update_statement(amount)
      update_transaction_history
    else
      error
    end
  end

  def display_statement
    @statement
  end

  def display_transaction_history
    @transaction_history
  end

  private

  def valid?(amount)
    if amount.kind_of?(Integer) == true && amount > 0
      return true
    elsif amount.kind_of?(Float) == true && amount > 0
      return true
    else
      false
    end
  end

  def error
    raise('Invalid request: minimum accepted value and format = 00.01')
  end

  def credit_update_statement(amount)
    statement[:time] = @time.inspect
    statement[:credit] = amount
    statement[:debit] = 0.0
    statement[:balance] = @balance
  end

  def debit_update_statement(amount)
    statement[:time] = @time.inspect
    statement[:credit] = 0.0
    statement[:debit] = amount
    statement[:balance] = @balance
  end

  def update_transaction_history
    transaction_history << statement
  end
end

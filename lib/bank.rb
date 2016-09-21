class Bank

  attr_reader :balance

  def initialize
    @balance = 0.0
  end

  def deposit(amount)
    if valid?(amount) == true
      @balance += amount
    else
      error
    end
  end

  def withdraw(amount)
    if valid?(amount) == true
      @balance -= amount
    else
      error
    end
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

end

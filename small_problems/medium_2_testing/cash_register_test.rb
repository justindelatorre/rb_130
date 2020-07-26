require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @cash_register = CashRegister.new(1000)
  end

  def test_accept_money
    register_copy = @cash_register.clone
    test_transaction = Transaction.new(100)
    test_transaction.amount_paid = 200

    assert_equal(1200, register_copy.accept_money(test_transaction))
  end

  def test_change
    register_copy = @cash_register.clone
    test_transaction = Transaction.new(100)
    test_transaction.amount_paid = 150

    assert_equal(50, register_copy.change(test_transaction))
  end

  def test_give_receipt
    register_copy = @cash_register.clone
    test_transaction = Transaction.new(100)

    assert_output("You've paid $100.\n") do
      register_copy.give_receipt(test_transaction)
    end
  end
end

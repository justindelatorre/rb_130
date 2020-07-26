require 'minitest/autorun'
require 'stringio'

require_relative 'transaction'

class TransactionTest < MiniTest::Test
  def setup
    @transaction = Transaction.new(100)
  end

  def test_prompt_for_payment
    test_transaction = @transaction.clone
    input = StringIO.new("200\n")
    output = StringIO.new

    test_transaction.prompt_for_payment(input: input, output: output)

    assert_equal(200, test_transaction.amount_paid)    
  end
end

require 'minitest/pride'
require 'minitest/autorun'
require './lib/transactions'

class TransactionsTest < MiniTest::Test

  def test_that_it_exists
    transaction = Transactions.new
    assert transaction
  end

  def test_that_it_contains_an_id
    transaction = Transactions.new
    transaction
  end
end

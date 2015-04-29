require 'minitest/pride'
require 'minitest/autorun'
require './lib/transactions'

class TransactionsTest < MiniTest::Test

  def setup
    engine = SalesEngine.new("./data")
    engine.startup
    @transaction = engine.transaction_repository.find_by_id(1)
    @transaction2 = engine.transaction_repository.find_by_id(12)
    @transaction3 = engine.transaction_repository.find_by_id(25)
  end

  def test_it_can_return_its_attributes
    assert_equal 1, @transaction.id
    assert_equal 1, @transaction.invoice_id
    assert_equal "4654405418249632", @transaction.credit_card_number
    assert_equal "2012-03-27 14:54:09 UTC", @transaction.created_at
    assert_equal "2012-03-27 14:54:09 UTC", @transaction.updated_at
    assert_equal "success", @transaction.result
  end

  def test_it_can_return_its_invoice
    assert_equal 1, @transaction.invoice.id
    assert_equal 12, @transaction2.invoice.id
    assert_equal 24, @transaction3.invoice.id
  end
end

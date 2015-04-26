require 'minitest/pride'
require 'minitest/autorun'
require './lib/customer'

class CustomerTest < MiniTest::Test

  def setup
  engine = Engine.new("./data")
  engine.startup
  @customer = engine.customers_repository.find_by_id("1")
  @customer2 = engine.customers_repository.find_by_id("2")
  @customer3 = engine.customers_repository.find_by_id("3")
  @customer4 = engine.customers_repository.find_by_id("4")
  @customer34 = engine.customers_repository.find_by_id("34")
  end

  def test_that_it_returns_all_associated_transactions
    assert_equal ["1", "2", "3", "4", "5", "6", "7"], @customer.transactions.map{|transaction| transaction.id}
    assert_equal ["8"], @customer2.transactions.map{|transaction| transaction.id}
    assert_equal ["9", "10", "11", "12", "13", "14", "15"], @customer3.transactions.map{|transaction| transaction.id}
    assert_equal ["16", "17", "18", "19", "20", "21", "22"], @customer4.transactions.map{|transaction| transaction.id}
    assert_equal ["186"], @customer34.transactions.map{|transaction| transaction.id}
  end

  def test_that_it_can_return_successful_invoices_by_customer
    assert_equal ["1", "2", "4", "5", "6", "7", "8"], @customer.successful_invoices.map{|invoice| invoice.id}
    assert_equal ["9"], @customer2.successful_invoices.map{|invoice| invoice.id}
    assert_equal ["10", "11", "12"], @customer3.successful_invoices.map{|invoice| invoice.id}
    assert_equal ["15", "16", "17", "18", "19", "20", "21"], @customer4.successful_invoices.map{|invoice| invoice.id}
    assert_equal ["169"], @customer34.successful_invoices.map{|invoice| invoice.id}
  end

  def test_that_it_can_return_a_favorite_merchant
    assert_equal "Kirlin, Jakubowski and Smitham", @customer.favorite_merchant.name
    assert_equal "Shields, Hirthe and Smith", @customer2.favorite_merchant.name
    assert_equal "Marvin Group", @customer3.favorite_merchant.name
    assert_equal "Friesen, Hackett and Runte", @customer4.favorite_merchant.name
    assert_equal "Johnson-Wiza", @customer34.favorite_merchant.name
  end
end

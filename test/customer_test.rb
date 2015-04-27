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

  def test_that_it_can_return_its_attributes
    assert_equal "1", @customer.id
    assert_equal "Joey", @customer.first_name
    assert_equal "Ondricka", @customer.last_name
    assert_equal "2012-03-27 14:54:09 UTC", @customer.created_at
    assert_equal "2012-03-27 14:54:09 UTC", @customer.updated_at
  end

  def test_that_it_returns_all_associated_invoices
    assert_equal 8, @customer.invoices.size
    assert_equal 1, @customer2.invoices.size
    assert_equal 4, @customer3.invoices.size
    assert_equal 8, @customer4.invoices.size
    assert_equal 1, @customer34.invoices.size
  end

  def test_that_it_returns_all_associated_transactions
    assert_equal 7, @customer.transactions.size
    assert_equal ["8"], @customer2.transactions.map{|transaction| transaction.id}
    assert_equal ["9", "10", "11", "12", "13", "14", "15"], @customer3.transactions.map{|transaction| transaction.id}
    assert_equal ["16", "17", "18", "19", "20", "21", "22"], @customer4.transactions.map{|transaction| transaction.id}
    assert_equal ["186"], @customer34.transactions.map{|transaction| transaction.id}
  end

  def test_that_it_can_return_successful_invoices_by_customer
    assert_equal 7, @customer.successful_invoices.size
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

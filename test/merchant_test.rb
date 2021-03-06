require 'csv'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/merchant'
require './lib/sales_engine'
class MerchantTest < MiniTest::Test

  def setup
    engine = SalesEngine.new("./data")
    engine.startup
    @merchant = engine.merchant_repository.find_by_id(1)
    @merchant2 = engine.merchant_repository.find_by_id(2)
    @merchant3 = engine.merchant_repository.find_by_id(3)
    @merchant4 = engine.merchant_repository.find_by_id(4)
    @merchant34 = engine.merchant_repository.find_by_id(34)
    @merchant26 = engine.merchant_repository.find_by_id(26)
  end

  def test_that_it_returns_merchant_attributes
    assert_equal 1, @merchant.id
    assert_equal "Schroeder-Jerde", @merchant.name
    assert_equal "2012-03-27 14:53:59 UTC", @merchant.created_at
    assert_equal "2012-03-27 14:53:59 UTC", @merchant.updated_at
  end

  def test_that_it_returns_items
    assert_equal 15, @merchant.items.size
    assert_equal 38, @merchant2.items.size
    assert_equal 26, @merchant3.items.size
    assert_equal 12, @merchant4.items.size
    assert_equal 42, @merchant34.items.size
  end

  def test_that_it_returns_all_invoices
    assert_equal 59, @merchant.invoices.size
    assert_equal 49, @merchant2.invoices.size
    assert_equal 43, @merchant3.invoices.size
    assert_equal 52, @merchant4.invoices.size
    assert_equal 51, @merchant34.invoices.size
  end

  def test_that_it_returns_only_successful_invoices
    assert_equal 56, @merchant.successful_invoices.size
    assert_equal 47, @merchant2.successful_invoices.size
    assert_equal 39, @merchant3.successful_invoices.size
    assert_equal 50, @merchant4.successful_invoices.size
    assert_equal 49, @merchant34.successful_invoices.size
  end

  def test_that_it_returns_revenue_without_a_date
    assert_equal "528774.64", @merchant.revenue.to_digits
    assert_equal "436253.19", @merchant2.revenue.to_digits
    assert_equal "338055.54", @merchant3.revenue.to_digits
    assert_equal "558055.22", @merchant4.revenue.to_digits
    assert_equal "573424.54", @merchant34.revenue.to_digits
  end

  def test_that_it_returns_revenue_with_a_date
    assert_equal "24641.43", @merchant.revenue("2012-03-25 13:54:11 UTC").to_d.to_digits
    assert_equal 9163588, @merchant26.revenue("2012-03-25 09:54:09 UTC")*100.to_i
  end

  def test_that_it_can_find_its_favorite_customer
    assert_equal 941, @merchant.favorite_customer.id
    assert_equal 988, @merchant2.favorite_customer.id
    assert_equal 992, @merchant3.favorite_customer.id
    assert_equal 921, @merchant4.favorite_customer.id
    assert_equal 968, @merchant34.favorite_customer.id
  end

  def test_that_it_returns_customers_with_pending_invoices
    assert_equal 3, @merchant.customers_with_pending_invoices.size
    assert_equal 197, @merchant.customers_with_pending_invoices[0].id
    assert_equal 2, @merchant34.customers_with_pending_invoices.size
    assert_equal 3, @merchant34.customers_with_pending_invoices[0].id
  end
end

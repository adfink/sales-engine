require 'csv'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/merchant'
require './lib/engine'
class MerchantTest < MiniTest::Test

  def setup
    engine = Engine.new("./data")
    engine.startup
    @merchant = engine.merchants_repository.find_by_id("1")
    @merchant2 = engine.merchants_repository.find_by_id("2")
    @merchant3 = engine.merchants_repository.find_by_id("3")
    @merchant4 = engine.merchants_repository.find_by_id("4")
    @merchant34 = engine.merchants_repository.find_by_id("34")
  end

  def test_that_it_returns_merchant_attributes
    assert_equal "Schroeder-Jerde", @merchant.name
    assert_equal "2012-03-27 14:53:59 UTC", @merchant.created_at
    assert_equal "2012-03-27 14:53:59 UTC", @merchant.updated_at
  end

  def test_that_it_returns_invoices
    assert_equal 59, @merchant.invoices.count
  end

  def test_that_it_can_find_its_favorite_customer
    assert_equal "921", @merchant4.favorite_customer.id
  end

  def test_that_it_returns_revenue_of_a_single_merchant_on_a_single_day
   assert_equal "528774.64", @merchant.revenue
   assert_equal "573424.54", @merchant34.revenue
  end
end

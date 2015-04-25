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
  end

  def test_that_it_returns_merchant_attributes
    assert_equal "Schroeder-Jerde", @merchant.name
    assert_equal "2012-03-27 14:53:59 UTC", @merchant.created_at
    assert_equal "2012-03-27 14:53:59 UTC", @merchant.updated_at
  end

  # def test_that_it_can_return_revenue_by_invoice_date
  #   assert_equal "24641.43", @merchant.merchant_revenue_by_invoice_date("2012-03-27 14:53:59 UTC")
  # end

end

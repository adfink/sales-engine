require 'csv'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/merchant'
require './lib/engine'

class MerchantTest < MiniTest::Test

  def setup

  end

  def test_it_exists
    merchant = Merchant.new(@rows[0], @engine.merchants_repository)
    puts merchant
    assert merchant
    assert_equal "1", merchant.id
  end

  def test_it_can_return_items
    skip
    merchant = Merchant.new(@rows[0], @engine.merchants_repository)
    assert_equal [], merchant.items
  end
end

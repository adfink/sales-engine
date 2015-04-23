require 'minitest/pride'
require 'minitest/autorun'
require './lib/merchant'

class MerchantTest < MiniTest::Test

  def test_it_exists
    merchant = Merchant.new
    assert merchant
  end
end

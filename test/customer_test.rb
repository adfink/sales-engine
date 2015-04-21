require 'minitest/pride'
require 'minitest/autorun'
require './lib/customer'

class CustomerTest < MiniTest::Test

  def test_that_it_exists
    customer = Customer.new
    assert customer
  end

  def test_that_it_contains_an_id
    customer = Customer.new
    customer
  end
end

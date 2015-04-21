require 'minitest/pride'
require 'minitest/autorun'
require './lib/customer_repository'

class CustomerRepositoryTest < MiniTest::Test

  def test_that_it_exists
    customer_repo = CustomerRepository.new
    assert customer_repo
  end
end

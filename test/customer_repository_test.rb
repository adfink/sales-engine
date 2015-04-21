require 'minitest/pride'
require 'minitest/autorun'
require './lib/customer_repository'

class CustomerRepositoryTest < MiniTest::Test

  def test_that_it_exists
    customer_repo = CustomerRepository.new
    assert customer_repo
  end

  def test_that_it_can_find_the_file_to_read
    customer_repo = CustomerRepository.new
    assert customer_repo.check_for_file
  end

  def test_that_it_can_output_the_file_contents
    customer_repo = CustomerRepository.new
    refute_equal "", customer_repo.output_file_contents
  end
end

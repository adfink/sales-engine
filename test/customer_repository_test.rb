require 'minitest/pride'
require 'minitest/autorun'
require './lib/customer_repository'

class CustomerRepositoryTest < MiniTest::Test

  def test_that_it_exists
    customer_repo = CustomerRepository.new
    assert customer_repo
  end

  def test_that_it_can_output_the_file_contents
    customer_repo = CustomerRepository.new
    refute_equal "", customer_repo.output_file_contents
  end

  def test_that_it_stores_its_data_in_an_array
    customer_repo = CustomerRepository.new
    refute customer_repo.customers.empty?
    assert_equal Array, customer_repo.customers.class
  end

  def test_that_it_can_return_all_instances_of_rep
    customer_repo = CustomerRepository.new
    assert_equal 1000, customer_repo.all.length
  end

  def test_that_it_can_output_a_single_random_instance
    customer_repo = CustomerRepository.new
    assert customer_repo.all.include?(customer_repo.random)
  end

  def test_it_can_find_by_id
    customer_repo = CustomerRepository.new
    assert_equal "Ondricka", customer_repo.find_by_id("1").last_name
  end

  def test_it_can_find_by_first_name
    customer_repo = CustomerRepository.new
    assert_equal "Ondricka", customer_repo.find_by_first_name("Joey").last_name
  end

  def test_it_can_find_by_last_name
    customer_repo = CustomerRepository.new
    assert_equal "Joey", customer_repo.find_by_last_name("Ondricka").first_name
  end

  def test_it_can_find_by_created_at
    customer_repo = CustomerRepository.new
    assert_equal "Joey", customer_repo.find_by_created_at(2012-03-27 14:54:09).last_name
  end
end

require 'minitest/pride'
require 'minitest/autorun'
require './lib/customers_repository'

class CustomersRepositoryTest < MiniTest::Test

  def test_that_it_exists
    customer_repo = CustomersRepository.new(nil)
    assert customer_repo
  end

  def test_that_it_stores_its_data_in_an_array
    customer_repo = CustomersRepository.new(nil)
    refute customer_repo.customers.empty?
    assert_equal Array, customer_repo.customers.class
  end

  def test_that_it_can_return_all_instances_of_rep
    customer_repo = CustomersRepository.new(nil)
    assert_equal 1000, customer_repo.all.length
  end

  def test_that_it_can_output_a_single_random_instance
    customer_repo = CustomersRepository.new(nil)
    assert customer_repo.all.include?(customer_repo.random)
  end

  def test_it_can_find_by_id
    customer_repo = CustomersRepository.new(nil)
    assert_equal "Ondricka", customer_repo.find_by_id("1").last_name
  end

  def test_it_can_find_all_by_first_name
    customer_repo = CustomersRepository.new(nil)
    assert_equal ["Nader", "Frami"], customer_repo.find_all_by_first_name("Ashly").map{|customer| customer.last_name}
    assert_equal [], customer_repo.find_all_by_first_name("Max").map{|customer| customer.last_name}
  end

  def test_it_can_find_by_first_name
    customer_repo = CustomersRepository.new(nil)
    assert_equal "Ondricka", customer_repo.find_by_first_name("Joey").last_name
  end

  def test_it_can_find_all_by_last_name
    customer_repo = CustomersRepository.new(nil)
    assert_equal ["Imani", "Demarco"], customer_repo.find_all_by_last_name("Smitham").map{|customer| customer.first_name}
    assert_equal [], customer_repo.find_all_by_first_name("Max").map{|customer| customer.first_name}
  end

  def test_it_can_find_by_last_name
    customer_repo = CustomersRepository.new(nil)
    assert_equal "Joey", customer_repo.find_by_last_name("Ondricka").first_name
  end

  def test_it_can_find_all_by_created_at
    customer_repo = CustomersRepository.new(nil)
    assert_equal ["Loyal", "Dejon", "Ramona"], customer_repo.find_all_by_created_at("2012-03-27 14:54:11 UTC").map{|customer| customer.first_name}
    assert_equal [], customer_repo.find_all_by_first_name("2015-03-27 14:54:11 UTC").map{|customer| customer.last_name}
  end

  def test_it_can_find_by_created_at
    customer_repo = CustomersRepository.new(nil)
    assert_equal "Joey", customer_repo.find_by_created_at("2012-03-27 14:54:09 UTC").first_name
  end

  def test_it_can_find_all_by_updated_at
    customer_repo = CustomersRepository.new(nil)
    assert_equal ["Loyal", "Dejon", "Ramona"], customer_repo.find_all_by_updated_at("2012-03-27 14:54:11 UTC").map{|customer| customer.first_name}
    assert_equal [], customer_repo.find_all_by_first_name("2015-03-27 14:54:11 UTC").map{|customer| customer.last_name}
  end

  def test_it_can_find_by_updated_at
    customer_repo = CustomersRepository.new(nil)
    assert_equal "Joey", customer_repo.find_by_updated_at("2012-03-27 14:54:09 UTC").first_name
  end
end

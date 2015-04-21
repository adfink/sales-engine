require 'minitest/pride'
require 'minitest/autorun'
require './lib/customer_repository'

class CustomerRepositoryTest < MiniTest::Test

  def test_that_it_exists
    customer_repo = CustomerRepository.new
    assert customer_repo
  end

<<<<<<< HEAD
  def test_that_it_can_find_its_data_file
    customer_repo = CustomerRepository.new
    assert customer_repo.locate_data_file
=======
  def test_that_it_can_find_the_file_to_read
    customer_repo = CustomerRepository.new
    assert customer_repo.check_for_file
>>>>>>> b6f86039a688d0f5914c4e4a50cde1e63b36b432
  end

  def test_that_it_can_output_the_file_contents
    customer_repo = CustomerRepository.new
    refute_equal "", customer_repo.output_file_contents
  end
end

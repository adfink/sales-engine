gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/transactions_repository.rb'

class TransactionsRepositoryTest < Minitest::Test

  def test_that_it_exists
    transactions_repo = TransactionsRepository.new
    assert transactions_repo
  end

  def test_that_it_can_output_the_file_contents
    transactions_repo = TransactionsRepository.new
    refute_equal "", transactions_repo.output_file_contents
  end

  def test_that_it_stores_its_data_in_an_array
    transactions_repo = TransactionsRepository.new
    refute transactions_repo.transactions.empty?
    assert_equal Array, transactions_repo.transactions.class
  end

  def test_that_it_can_return_all_instances_of_rep
    transactions_repo = TransactionsRepository.new
    assert_equal 5595, transactions_repo.all.length
  end

  def test_that_it_can_output_a_single_random_instance
    transactions_repo = TransactionsRepository.new
    assert transactions_repo.all.include?(transactions_repo.random)
  end

  def test_it_can_find_by_id
    transactions_repo = TransactionsRepository.new
    assert_equal "4654405418249632", transactions_repo.find_by_id("1").credit_card_number
    assert_equal "1",transactions_repo.find_by_id("1").id
  end

  def test_it_can_find_by_invoice_id
    transactions_repo = TransactionsRepository.new
    assert_equal "4580251236515201", transactions_repo.find_by_invoice_id("2").credit_card_number
  end

  def test_it_can_find_all_by_invoice_id
    transactions_repo = TransactionsRepository.new
    assert_equal ["4800749911485986", "4017503416578382", "4536896898764278"], transactions_repo.find_all_by_invoice_id("12").map{|transaction| transaction.credit_card_number}
  end



end



#
#
#
#

#   def test_it_can_find_by_first_name
#     transactions_repo = TransactionsRepository.new
#     assert_equal "Ondricka", transactions_repo.find_by_first_name("Joey").last_name
#   end
#
#   def test_it_can_find_all_by_last_name
#     transactions_repo = TransactionsRepository.new
#     assert_equal ["Imani", "Demarco"], transactions_repo.find_all_by_last_name("Smitham").map{|customer| customer.first_name}
#     assert_equal [], transactions_repo.find_all_by_first_name("Max").map{|customer| customer.first_name}
#   end
#
#   def test_it_can_find_by_last_name
#     transactions_repo = TransactionsRepository.new
#     assert_equal "Joey", transactions_repo.find_by_last_name("Ondricka").first_name
#   end
#
#   def test_it_can_find_all_by_created_at
#     transactions_repo = TransactionsRepository.new
#     assert_equal ["Loyal", "Dejon", "Ramona"], transactions_repo.find_all_by_created_at("2012-03-27 14:54:11 UTC").map{|customer| customer.first_name}
#     assert_equal [], transactions_repo.find_all_by_first_name("2015-03-27 14:54:11 UTC").map{|customer| customer.last_name}
#   end
#
#   def test_it_can_find_by_created_at
#     transactions_repo = TransactionsRepository.new
#     assert_equal "Joey", transactions_repo.find_by_created_at("2012-03-27 14:54:09 UTC").first_name
#   end
#
#   def test_it_can_find_all_by_updated_at
#     transactions_repo = TransactionsRepository.new
#     assert_equal ["Loyal", "Dejon", "Ramona"], transactions_repo.find_all_by_updated_at("2012-03-27 14:54:11 UTC").map{|customer| customer.first_name}
#     assert_equal [], transactions_repo.find_all_by_first_name("2015-03-27 14:54:11 UTC").map{|customer| customer.last_name}
#   end
#
#   def test_it_can_find_by_updated_at
#     transactions_repo = TransactionsRepository.new
#     assert_equal "Joey", transactions_repo.find_by_updated_at("2012-03-27 14:54:09 UTC").first_name
#   end
# end

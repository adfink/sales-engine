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

  def test_it_can_find_by_credit_card_number
    transactions_repo = TransactionsRepository.new
    assert_equal "4", transactions_repo.find_by_credit_card_number("4515551623735607").id
  end

  def test_it_can_find_all_by_credit_card_number
    transactions_repo = TransactionsRepository.new
    assert_equal ["4515551623735607"], transactions_repo.find_all_by_credit_card_number("4515551623735607").map{|transaction| transaction.credit_card_number}
  end

  def test_it_can_find_by_created_at
    transactions_repo = TransactionsRepository.new
    assert_equal "3", transactions_repo.find_by_created_at("2012-03-27 14:54:10 UTC").id
  end

  def test_it_can_find_all_by_created_at
    transactions_repo = TransactionsRepository.new
    assert_equal ["3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22"], transactions_repo.find_all_by_created_at("2012-03-27 14:54:10 UTC").map{|transaction| transaction.id}
  end

  def test_it_can_find_by_updated_at
    transactions_repo = TransactionsRepository.new
    assert_equal "1", transactions_repo.find_by_updated_at("2012-03-27 14:54:09 UTC").id
  end

  def test_it_can_find_all_by_updated_at
    transactions_repo = TransactionsRepository.new
    assert_equal ["1","2"], transactions_repo.find_all_by_updated_at("2012-03-27 14:54:09 UTC").map{|transaction| transaction.id}
  end

  def test_it_can_find_by_result
    transactions_repo = TransactionsRepository.new
    assert_equal "11", transactions_repo.find_by_result("failed").id
  end

  def test_it_can_find_all_by_result
    transactions_repo = TransactionsRepository.new
    assert_equal 947, transactions_repo.find_all_by_result("failed").map{|transaction| transaction.id}.count
  end


end


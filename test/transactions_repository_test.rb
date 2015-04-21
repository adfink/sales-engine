gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/transactions_repository.rb'

class TransactionsRepositoryTest < Minitest::Test

  def test_that_it_exists
    transactions = TransactionsRepository.new
    assert transactions
  end

  def test_that_it_can_load_the_csv_files
    transactions = TransactionsRepository.new
    refute_equal "", transactions.get_info_from_csv
  end

end

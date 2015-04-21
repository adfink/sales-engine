gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/transactions_repository.rb'

class TransactionsRepositoryTest < Minitest::Test

  def test_there_is_a_merchants_repo
    repo = TransactionsRepository.new
  end

end

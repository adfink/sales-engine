gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchants_repository.rb'

class MerchantsRepositoryTest < Minitest::Test

  def test_there_is_a_merchants_repo
  repo = MerchantsRepository.new
  end

end

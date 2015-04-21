gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchants_repository.rb'

class MerchantsRepositoryTest < Minitest::Test

  def test_there_is_a_merchants_repo
    merchant_repo = MerchantsRepository.new
    assert merchant_repo
  end

  def test_it_can_recognize_its_data_file
    merchants_repo = MerchantsRepository.new
    assert merchants_repo.check_for_file
  end

  def test_it_can_output_its_data_from_the_file
    merchants_repo = MerchantsRepository.new
    refute_equal "", merchants_repo.output_file_contents
  end
end

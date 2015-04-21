gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchants_repository.rb'

class MerchantsRepositoryTest < Minitest::Test

  def test_there_is_a_merchants_repo
    repo = MerchantsRepository.new
    assert repo
  end

  def test_that_it_recognizes_the_data_file
    repo = MerchantsRepository.new
    assert repo.find_file
  end

  def test_that_it_can_output_the_file_contents
    repo = MerchantsRepository.new
    refute_equal "", repo.output_file_contents
  end

end

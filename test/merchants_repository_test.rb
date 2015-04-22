gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchants_repository.rb'

class MerchantsRepositoryTest < Minitest::Test

  def test_it_can_recognize_its_data_file
    merchants_repo = MerchantsRepository.new
    assert merchants_repo.check_for_file
  end

  def test_it_can_output_its_data_from_the_file
    merchants_repo = MerchantsRepository.new
    refute_equal "", merchants_repo.output_file_contents
  end

  def test_that_it_stores_its_data_in_an_array
    merchants_repo = MerchantsRepository.new
    refute merchants_repo.merchants.empty?
    assert_equal Array, merchants_repo.merchants.class
  end

  def test_that_it_can_return_all_instances_of_repo
    merchants_repo = MerchantsRepository.new
    assert_equal 100, merchants_repo.all.length
  end

  def test_that_it_can_output_a_single_random_instance
    merchants_repo = MerchantsRepository.new
    assert merchants_repo.all.include?(merchants_repo.random)
  end

  def test_it_can_find_by_id
    merchants_repo = MerchantsRepository.new
    assert_equal "Schroeder-Jerde", merchants_repo.find_by_id("1").name
  end

  def test_it_can_find_all_by_name
    merchants_repo = MerchantsRepository.new
    assert_equal ["1"], merchants_repo.find_all_by_name("Schroeder-Jerde").map{|customer| customer.id}
    assert_equal [], merchants_repo.find_all_by_name("Max").map{|customer| customer.id}
  end

  def test_it_can_find_by_name
    merchants_repo = MerchantsRepository.new
    assert_equal "1", merchants_repo.find_by_name("Schroeder-Jerde").id
  end

  def test_it_can_find_all_by_created_at
    merchants_repo = MerchantsRepository.new
    assert_equal ["1", "2", "3", "4", "5", "6", "7", "8", "9"], merchants_repo.find_all_by_created_at("2012-03-27 14:53:59 UTC").map{|customer| customer.id}
    assert_equal [], merchants_repo.find_all_by_created_at("2015-03-27 14:54:11 UTC").map{|customer| customer.id}
  end

  def test_it_can_find_by_created_at
    merchants_repo = MerchantsRepository.new
    assert_equal "1", merchants_repo.find_by_created_at("2012-03-27 14:53:59 UTC").id
  end

  def test_it_can_find_all_by_updated_at
    merchants_repo = MerchantsRepository.new
    assert_equal ["1", "2", "3", "4", "5", "7", "8", "9"], merchants_repo.find_all_by_updated_at("2012-03-27 14:53:59 UTC").map{|customer| customer.id}
    assert_equal [], merchants_repo.find_all_by_updated_at("2015-03-27 14:53:59 UTC").map{|customer| customer.last_name}
  end

  def test_it_can_find_by_updated_at
    merchants_repo = MerchantsRepository.new
    assert_equal "1", merchants_repo.find_by_updated_at("2012-03-27 14:53:59 UTC").id
  end
end

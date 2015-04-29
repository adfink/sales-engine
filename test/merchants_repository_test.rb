gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant_repository.rb'

class MerchantRepositoryTest < Minitest::Test

  def setup
    @engine = SalesEngine.new("./data")
    @engine.startup

  end
  def test_it_can_recognize_its_fixtures_file
    merchants_repo = MerchantRepository.new(nil, "./fixtures/merchants.csv")
    assert merchants_repo.check_for_file("./fixtures/merchants.csv")
  end

  def test_it_can_output_its_fixtures_from_the_file
    merchants_repo = MerchantRepository.new(nil, "./fixtures/merchants.csv")
    refute_equal "", merchants_repo.output_file_contents("./fixtures/merchants.csv")
  end

  def test_that_it_stores_its_fixtures_in_an_array
    merchants_repo = MerchantRepository.new(nil, "./fixtures/merchants.csv")
    refute merchants_repo.merchants.empty?
    assert_equal Array, merchants_repo.merchants.class
  end

  def test_that_it_can_return_all_instances_of_repo
    merchants_repo = MerchantRepository.new(nil, "./fixtures/merchants.csv")
    assert_equal 10, merchants_repo.all.length
  end

  def test_that_it_can_output_a_single_random_instance
    merchants_repo = MerchantRepository.new(nil, "./fixtures/merchants.csv")
    assert merchants_repo.all.include?(merchants_repo.random)
  end

  def test_it_can_find_by_id
    merchants_repo = MerchantRepository.new(nil, "./fixtures/merchants.csv")
    assert_equal "Schroeder-Jerde", merchants_repo.find_by_id(1).name
  end

  def test_it_can_find_all_by_name
    merchants_repo = MerchantRepository.new(nil, "./fixtures/merchants.csv")
    assert_equal [1], merchants_repo.find_all_by_name("Schroeder-Jerde").map{|customer| customer.id}
    assert_equal [], merchants_repo.find_all_by_name("Max").map{|customer| customer.id}
  end

  def test_it_can_find_by_name
    merchants_repo = MerchantRepository.new(nil, "./fixtures/merchants.csv")
    assert_equal 1, merchants_repo.find_by_name("Schroeder-Jerde").id
  end

  def test_it_can_find_all_by_created_at
    merchants_repo = MerchantRepository.new(nil, "./fixtures/merchants.csv")
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9], merchants_repo.find_all_by_created_at("2012-03-27 14:53:59 UTC").map{|customer| customer.id}
    assert_equal [], merchants_repo.find_all_by_created_at("2015-03-27 14:54:11 UTC").map{|customer| customer.id}
  end

  def test_it_can_find_by_created_at
    merchants_repo = MerchantRepository.new(nil, "./fixtures/merchants.csv")
    assert_equal 1, merchants_repo.find_by_created_at("2012-03-27 14:53:59 UTC").id
  end

  def test_it_can_find_all_by_updated_at
    merchants_repo = MerchantRepository.new(nil, "./fixtures/merchants.csv")
    assert_equal [1, 2, 3, 4, 5, 7, 8, 9], merchants_repo.find_all_by_updated_at("2012-03-27 14:53:59 UTC").map{|customer| customer.id}
    assert_equal [], merchants_repo.find_all_by_updated_at("2015-03-27 14:53:59 UTC").map{|customer| customer.last_name}
  end

  def test_it_can_find_by_updated_at
    merchants_repo = MerchantRepository.new(nil, "./fixtures/merchants.csv")
    assert_equal 1, merchants_repo.find_by_updated_at("2012-03-27 14:53:59 UTC").id
  end

  def test_it_can_find_the_top_x_merchants_by_rev
    assert_equal [14, 89, 98, 10, 61, 79, 53, 90, 36, 84], @engine.merchant_repository.most_revenue(10).map{|merchant| merchant.id}
  end

  def test_that_it_can_return_all_items_by_merchant_id
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], @engine.find_all_items_by_merchant_id(1).map{|item| item.id}
  end

  def test_that_it_can_return_the_top_x_merchants_by_items
    assert_equal [89, 12, 22, 98, 74, 49, 58, 84, 54, 1], @engine.merchant_repository.most_items(10).map{|merchant| merchant.id}
  end

  def test_that_it_can_return_the_total_revenue_by_x_date
    merchants_repo = MerchantRepository.new(@engine, "./data/merchants.csv")
    assert_equal 283071890, merchants_repo.revenue("2012-03-25 13:54:11 UTC")*100.to_i
    assert_equal BigDecimal, merchants_repo.revenue("2012-03-25 13:54:11 UTC").class
  end
end

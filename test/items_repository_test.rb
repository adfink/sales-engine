require 'minitest/pride'
require 'minitest/autorun'
require './lib/items_repository'

class ItemsRepositoryTest < MiniTest::Test

  def test_that_it_exists
    items_repo = ItemsRepository.new(nil, "./fixtures/items.csv")
    assert items_repo
  end

  def test_that_it_stores_its_fixtures_in_an_array
    items_repo = ItemsRepository.new(nil, "./fixtures/items.csv")
    refute items_repo.items.empty?
    assert_equal Array, items_repo.items.class
  end

  def test_that_it_can_return_all_instances_of_rep
    items_repo = ItemsRepository.new(nil, "./fixtures/items.csv")
    assert_equal 10, items_repo.all.length
  end

  def test_that_it_can_output_a_single_random_instance
    items_repo = ItemsRepository.new(nil, "./fixtures/items.csv")
    assert items_repo.all.include?(items_repo.random)
  end

  def test_it_can_find_by_id
    items_repo = ItemsRepository.new(nil, "./fixtures/items.csv")
    assert_equal "Item Qui Esse", items_repo.find_by_id("1").name
  end

  def test_it_can_find_all_by_name
    items_repo = ItemsRepository.new(nil, "./fixtures/items.csv")
    assert_equal ["1"], items_repo.find_all_by_name("Item Qui Esse").map{|item| item.id}
    assert_equal [], items_repo.find_all_by_name("Max").map{|item| item.id}
  end

  def test_it_can_find_by_name
    items_repo = ItemsRepository.new(nil, "./fixtures/items.csv")
    assert_equal "2", items_repo.find_by_name("Item Autem Minima").id
  end

  def test_it_can_find_all_by_description
    items_repo = ItemsRepository.new(nil, "./fixtures/items.csv")
    assert_equal ["1", "10"], items_repo.find_all_by_description("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.").map{|item| item.id}
    assert_equal [], items_repo.find_all_by_description("Max").map{|item| item.id}
  end

  def test_it_can_find_by_description
    items_repo = ItemsRepository.new(nil, "./fixtures/items.csv")
    assert_equal "1", items_repo.find_by_description("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.").id
  end

  def test_it_can_find_all_by_unit_price
    items_repo = ItemsRepository.new(nil, "./fixtures/items.csv")
    assert_equal ["1", "9"], items_repo.find_all_by_unit_price("75107").map{|item| item.id}
  end

  def test_it_can_find_by_unit_price
    items_repo = ItemsRepository.new(nil, "./fixtures/items.csv")
    assert_equal "1", items_repo.find_by_unit_price("75107").id
  end

  def test_it_can_find_all_by_merchant_id
    items_repo = ItemsRepository.new(nil, "./fixtures/items.csv")
    assert_equal ["1", "2", "3", "4", "5", "6", "7", "8", "9"], items_repo.find_all_by_merchant_id("1").map {|merchant| merchant.id}
  end

  def test_it_can_find_by_merchant_id
    items_repo = ItemsRepository.new(nil, "./fixtures/items.csv")
    assert_equal "10", items_repo.find_by_merchant_id("2").id
  end

  def test_it_can_find_all_by_created_at
    items_repo = ItemsRepository.new(nil, "./fixtures/items.csv")
    assert_equal ["1", "2", "3", "4", "5", "6", "7", "8", "9"], items_repo.find_all_by_created_at("2012-03-27 14:53:59 UTC").map{|item| item.id}
    assert_equal [], items_repo.find_all_by_created_at("2015-03-27 14:54:11 UTC").map{|item| item.id}
  end

  def test_it_can_find_by_created_at
    items_repo = ItemsRepository.new(nil, "./fixtures/items.csv")
    assert_equal "1", items_repo.find_by_created_at("2012-03-27 14:53:59 UTC").id
  end

  def test_it_can_find_all_by_updated_at
    items_repo = ItemsRepository.new(nil, "./fixtures/items.csv")
    assert_equal ["1", "2", "3", "4", "5", "6", "7", "8", "9"], items_repo.find_all_by_updated_at("2012-03-27 14:53:59 UTC").map{|item| item.id}
    assert_equal [], items_repo.find_all_by_updated_at("2015-03-27 14:53:59 UTC").map{|item| item.id}
  end

  def test_it_can_find_by_updated_at
    items_repo = ItemsRepository.new(nil, "./fixtures/items.csv")
    assert_equal "1", items_repo.find_by_updated_at("2012-03-27 14:53:59 UTC").id
  end
end

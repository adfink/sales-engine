require 'minitest/pride'
require 'minitest/autorun'
require './lib/item'

class ItemTest < MiniTest::Test

  def setup
    engine = Engine.new("./data")
    engine.startup
    @item = engine.items_repository.find_by_id("1")
    @item2 = engine.items_repository.find_by_id("2")
    @item3 = engine.items_repository.find_by_id("3")
    @item4 = engine.items_repository.find_by_id("4")
    @item34 = engine.items_repository.find_by_id("34")
  end

  def test_it_can_return_its_attributes
    assert_equal "1", @item.id
    assert_equal "Item Qui Esse", @item.name
    assert_equal "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", @item.description
    assert_equal "75107", @item.unit_price
    assert_equal "1", @item.merchant_id
    assert_equal "2012-03-27 14:53:59 UTC", @item.created_at
    assert_equal "2012-03-27 14:53:59 UTC", @item.updated_at
  end

  def test_it_can_return_its_invoice_items
    assert_equal 24, @item.invoice_items.size
    assert_equal 17, @item2.invoice_items.size
    assert_equal 17, @item3.invoice_items.size
    assert_equal 19, @item4.invoice_items.size
    assert_equal 3, @item34.invoice_items.size
  end

  def test_it_can_return_its_best_day
    assert_equal "2012-03-17", @item.best_day
    assert_equal "2012-03-24", @item2.best_day
    assert_equal "2012-03-10", @item3.best_day
    assert_equal "2012-03-25", @item4.best_day
    assert_equal "2012-03-27", @item34.best_day
  end

  def test_that_it_can_return_revenue_of_item
    skip
    assert_equal "", @item.revenue
  end
end

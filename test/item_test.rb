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
  # def test_it_exists
  #   item = Item.new(row=nil, self)
  #   assert item
  # end

  def test_it_can_return_the_best_day_for_a_particular_item
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

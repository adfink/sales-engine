require 'minitest/pride'
require 'minitest/autorun'
require './lib/item'

class ItemTest < MiniTest::Test

  def test_it_exists
    item = Item.new(row=nil, self)
    assert item
  end
end

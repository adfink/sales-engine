require 'minitest/pride'
require 'minitest/autorun'
require './lib/engine'

class EngineTest < MiniTest::Test

  def test_it_exists
    engine = Engine.new("./data")
    assert engine
  end

  # def test_it_finds_all_items_by_merchant_id
  #   engine = Engine.new("./data")
  #   engine.startup
  # assert_equal [], engine.find_all_items_by_merchant_id("1")
  # end
end

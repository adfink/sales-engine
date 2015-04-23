require 'minitest/pride'
require 'minitest/autorun'
require './lib/engine'

class EngineTest < MiniTest::Test

  def test_it_exists
    engine = Engine.new("./data")
    assert engine
  end
end

require 'minitest/pride'
require 'minitest/autorun'
require './lib/items_repository'

class ItemsRepositoryTest < MiniTest::Test

  def test_that_it_exists
    items = ItemsRepository.new
    assert items
  end

  def test_that_it_can_load_the_csv_files
    items = ItemsRepository.new
    refute_equal "", items.get_info_from_csv
  end
end

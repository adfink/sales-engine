require 'minitest/pride'
require 'minitest/autorun'
require './lib/items_repository'

class ItemsRepositoryTest < MiniTest::Test

  def test_that_it_exists
    items_repo = ItemsRepository.new
    assert items_repo
  end

  def test_that_it_can_output_its_data_file
    items_repo = ItemsRepository.new
    refute_equal "", items_repo.output_file_contents
  end

  def test_that_it_can_load_the_csv_files
    items = ItemsRepository.new
    refute_equal "", items.get_info_from_csv
  end
end

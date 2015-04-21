gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_items_repository.rb'

class InvoiceItemsRepositoryTest < Minitest::Test

  def test_that_it_exists
    invoice_items = InvoiceItemsRepository.new
    assert invoice_items
  end

  def test_that_it_can_load_the_csv_files
    invoice_items = InvoiceItemsRepository.new
    refute_equal "", invoice_items.get_info_from_csv
  end

end

gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_items_repository.rb'

class InvoiceItemsRepositoryTest < Minitest::Test

  def test_that_it_exists
    invoice_items = InvoiceItemsRepository.new
    assert invoice_items
  end

  def test_that_it_will_recognize_its_data_file
    invoice_items_repo = InvoiceItemsRepository.new
    assert invoice_items_repo.check_for_file
  end

  def test_that_it_can_output_its_file_data
    invoice_items_repo = InvoiceItemsRepository.new
    refute_equal "", invoice_items_repo.output_file_contents
  end
end

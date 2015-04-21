require 'minitest/pride'
require 'minitest/autorun'
require './lib/invoice_repository'

class InvoiceRepositoryTest < MiniTest::Test

  def test_that_it_exists
    invoice_repo = InvoiceRepository.new
    assert invoice_repo
  end

  def test_that_it_can_find_the_file_to_read
    invoice_repo = InvoiceRepository.new
    assert invoice_repo.check_for_file
  end

  def test_that_it_can_output_the_contents_of_the_file
    invoice_repo = InvoiceRepository.new
    refute_equal "", invoice_repo.output_file_contents
  end
end

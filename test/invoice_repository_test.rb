require 'minitest/pride'
require 'minitest/autorun'
require './lib/invoice_repository'

class InvoiceRepositoryTest < MiniTest::Test

  def test_that_it_exists
    invoice = InvoiceRepository.new
    assert invoice
  end
end

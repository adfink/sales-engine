require 'minitest/pride'
require 'minitest/autorun'
require './lib/invoice'

class InvoiceTest < MiniTest::Test

  def test_that_it_exists
    invoice = Invoice.new
    assert invoice
  end
end

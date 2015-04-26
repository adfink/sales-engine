require 'minitest/pride'
require 'minitest/autorun'
require './lib/invoice'

class InvoiceTest < MiniTest::Test

  def setup
  engine = Engine.new("./data")
  engine.startup
  @invoice = engine.invoices_repository.find_by_id("1")
  @invoice2 = engine.invoices_repository.find_by_id("12")
  @invoice3 = engine.invoices_repository.find_by_id("13")
  end

  def test_it_can_tell_whether_its_a_successful_invoice
    assert_equal true, @invoice.successful?
    assert_equal true, @invoice2.successful?
    assert_equal false, @invoice3.successful?
  end


  # def test_that_it_exists
  #   invoice = Invoice.new
  #   assert invoice
  # end
end

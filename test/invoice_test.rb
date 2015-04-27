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

  def test_it_can_return_its_attributes
    assert_equal "1", @invoice.id
    assert_equal "1", @invoice.customer_id
    assert_equal "26", @invoice.merchant_id
    assert_equal "shipped", @invoice.status
    assert_equal "2012-03-25 09:54:09 UTC", @invoice.created_at
    assert_equal "2012-03-25 09:54:09 UTC", @invoice.updated_at
  end

  def test_it_can_return_its_transactions
    assert_equal 1, @invoice.transactions.size
    assert_equal 3, @invoice2.transactions.size
    assert_equal 2, @invoice3.transactions.size
  end

  def test_it_can_return_its_items
    assert_equal 8, @invoice.items.size
    assert_equal 6, @invoice2.items.size
    assert_equal 5, @invoice3.items.size
  end

  def test_it_can_return_its_customer
    assert_equal "Ondricka", @invoice.customer.last_name
    assert_equal "Toy", @invoice2.customer.last_name
    assert_equal "Toy", @invoice3.customer.last_name
  end

  def test_it_can_return_its_merchant
    assert_equal "Balistreri, Schaefer and Kshlerin", @invoice.merchant.name
    assert_equal "Osinski, Pollich and Koelpin", @invoice2.merchant.name
    assert_equal "Rutherford, Bogan and Leannon", @invoice3.merchant.name
  end

  def test_it_can_return_its_invoice_items
    assert_equal 8, @invoice.invoice_items.size
    assert_equal 6, @invoice2.invoice_items.size
    assert_equal 5, @invoice3.invoice_items.size
  end

  def test_it_can_tell_whether_its_a_successful_invoice
    assert_equal true, @invoice.successful?
    assert_equal true, @invoice2.successful?
    assert_equal false, @invoice3.successful?
  end
end

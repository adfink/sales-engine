require 'minitest/pride'
require 'minitest/autorun'
require './lib/invoice_item'
require 'bigdecimal'
require 'bigdecimal/util'

class InvoiceItemTest < MiniTest::Test

  def setup
    engine = Engine.new("./data")
    engine.startup
    @invoice_item = engine.invoice_items_repository.find_by_id("1")
    @invoice_item2 = engine.invoice_items_repository.find_by_id("12")
    @invoice_item3 = engine.invoice_items_repository.find_by_id("25")
  end

  def test_it_can_return_its_attributes
    assert_equal "1", @invoice_item.id
    assert_equal "539", @invoice_item.item_id
    assert_equal "1", @invoice_item.invoice_id
    assert_equal "5", @invoice_item.quantity
    assert_equal "136.35", (@invoice_item.unit_price.to_d/100).round(2).to_digits
    assert_equal "2012-03-27 14:54:09 UTC", @invoice_item.created_at
    assert_equal "2012-03-27 14:54:09 UTC", @invoice_item.updated_at
  end

  def test_it_can_return_its_invoice
    assert_equal "1", @invoice_item.invoice.id
    assert_equal "2", @invoice_item2.invoice.id
    assert_equal "5", @invoice_item3.invoice.id
  end

  def test_it_can_return_its_item
    assert_equal "1", @invoice_item.item.id
    assert_equal "12", @invoice_item2.item.id
    assert_equal "25", @invoice_item3.item.id
  end

  def test_it_can_return_its_total_cost
    assert_equal 68175, @invoice_item.total_cost
    assert_equal 248792, @invoice_item2.total_cost
    assert_equal 291114, @invoice_item3.total_cost
    assert_equal "681.75", (@invoice_item.total_cost.to_d/100).round(2).to_digits
    assert_equal "2487.92", (@invoice_item2.total_cost.to_d/100).round(2).to_digits
    assert_equal "2911.14", (@invoice_item3.total_cost.to_d/100).round(2).to_digits
  end
end

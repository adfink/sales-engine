require 'minitest/pride'
require 'minitest/autorun'
require './lib/engine'

class EngineTest < MiniTest::Test

  def test_it_exists
    engine = Engine.new("./fixtures")
    assert engine
  end

  def test_it_can_return_item_instances_by_merchant_id
    engine = Engine.new("./fixtures")
    engine.startup
    assert_equal "[item number 10]", engine.find_all_items_by_merchant_id("2").to_s
  end

  def test_it_can_return_invoice_instances_by_merchant_id
    engine = Engine.new("./fixtures")
    engine.startup
    assert_equal ["shipped", "notshipped"], engine.find_all_invoices_by_merchant_id("27").map(&:status)
  end

  def test_that_it_can_return_transaction_instances_by_invoice_id
    engine = Engine.new("./fixtures")
    engine.startup
    assert_equal "[transaction number 10, transaction number 11]", engine.find_all_transactions_by_invoice_id("11").to_s
  end

  def test_that_it_can_return_invoice_item_instances_by_invoice_id
    engine = Engine.new("./fixtures")
    engine.startup
    assert_equal ["1", "2", "3", "4", "5", "6", "7", "8"], engine.find_all_invoice_items_by_invoice_id("1").map{|invoice_item| invoice_item.id}
  end

  # it seems like this is working, but we'll have to do some adjusting to our fixtures to make sure we've got the right connections to test against them
  def test_that_it_can_return_all_instances_of_item_by_invoice_id
    engine = Engine.new("./data")
    engine.startup
    assert_equal ["539", "528", "523", "535", "529", "541", "530", "534"], engine.find_all_items_by_invoice_id("1").map{|item| item.id}
  end

  def test_that_it_can_return_a_customer_by_customer_id
    engine = Engine.new("./fixtures")
    engine.startup
    assert_equal "Joey", engine.find_customer_by_customer_id("1").first_name
  end

  def test_that_it_can_return_a_merchant_by_merchant_id
    engine = Engine.new("./fixtures")
    engine.startup
    assert_equal "Schroeder-Jerde", engine.find_merchant_by_merchant_id("1").name
  end

  def test_that_it_can_return_an_invoice_by_invoice_id
    engine = Engine.new("./fixtures")
    engine.startup
    assert_equal "shipped", engine.find_invoice_by_invoice_id("1").status
  end

  def test_that_it_can_return_an_item_by_item_id
    engine = Engine.new("./fixtures")
    engine.startup
    assert_equal "Item Qui Esse", engine.find_item_by_item_id("1").name
  end

  def test_that_it_can_return_invoice_item_instances_by_item_id
    engine = Engine.new("./fixtures")
    engine.startup
    assert_equal ["1"], engine.find_all_invoice_items_by_item_id("539").map {|invoice_item| invoice_item.id}
  end

  def test_that_it_can_return_invoice_instances_by_customer_id
    engine = Engine.new("./fixtures")
    engine.startup
    assert_equal "[invoice number 1, invoice number 2, invoice number 3, invoice number 4, invoice number 5, invoice number 6, invoice number 7, invoice number 8]", engine.find_all_invoices_by_customer_id("1").to_s
  end

  def test_that_it_returns_revenue_of_a_single_merchant
    engine = Engine.new("./data")
    engine.startup
    assert_equal "566123.01", engine.revenue_of_merchant("1")
  end
end

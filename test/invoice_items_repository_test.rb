require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_items_repository.rb'

class InvoiceItemsRepositoryTest < Minitest::Test

  def test_that_it_exists
    invoice_items = InvoiceItemsRepository.new(nil,"./fixtures/invoice_items.csv")
    assert invoice_items
  end

  def test_that_it_can_output_the_file_contents
    invoice_items_repo = InvoiceItemsRepository.new(nil,"./fixtures/invoice_items.csv")
    refute_equal "", invoice_items_repo.output_file_contents
  end

  def test_that_it_stores_its_fixtures_in_an_array
    invoice_items_repo = InvoiceItemsRepository.new(nil,"./fixtures/invoice_items.csv")
    refute invoice_items_repo.invoice_items.empty?
    assert_equal Array, invoice_items_repo.invoice_items.class
  end

  def test_that_it_can_return_all_instances_of_invoice_items_in_repo
    invoice_items_repo = InvoiceItemsRepository.new(nil,"./fixtures/invoice_items.csv")
    assert_equal 11, invoice_items_repo.all.length
  end

  def test_that_it_can_output_a_single_random_instance
    invoice_items_repo = InvoiceItemsRepository.new(nil,"./fixtures/invoice_items.csv")
    assert invoice_items_repo.all.include?(invoice_items_repo.random)
  end

  def test_it_can_find_by_id
    invoice_items_repo = InvoiceItemsRepository.new(nil,"./fixtures/invoice_items.csv")
    assert_equal "539", invoice_items_repo.find_by_id("1").item_id
    assert_equal "1",invoice_items_repo.find_by_id("1").id
  end

  def test_it_can_find_by_invoice_id
    invoice_items_repo = InvoiceItemsRepository.new(nil,"./fixtures/invoice_items.csv")
    assert_equal "9", invoice_items_repo.find_by_invoice_id("2").id
  end

  def test_it_can_find_all_by_invoice_id
    invoice_items_repo = InvoiceItemsRepository.new(nil,"./fixtures/invoice_items.csv")
    assert_equal ["1", "2", "3", "4", "5", "6", "7", "8"], invoice_items_repo.find_all_by_invoice_id("1").map{|invoice_item| invoice_item.id}
  end

  def test_it_can_find_by_item_id
    invoice_items_repo = InvoiceItemsRepository.new(nil,"./fixtures/invoice_items.csv")
    assert_equal "1", invoice_items_repo.find_by_item_id("539").id
  end

  def test_it_can_find_all_by_item_id
    invoice_items_repo = InvoiceItemsRepository.new(nil,"./fixtures/invoice_items.csv")
    assert_equal ["10","11"], invoice_items_repo.find_all_by_item_id("1830").map{|invoice_item| invoice_item.id}
  end

  def test_it_can_find_by_quanitity
    invoice_items_repo = InvoiceItemsRepository.new(nil,"./fixtures/invoice_items.csv")
    assert_equal "8", invoice_items_repo.find_by_quantity("6").id
  end

  def test_it_can_find_all_by_quantity
    invoice_items_repo = InvoiceItemsRepository.new(nil,"./fixtures/invoice_items.csv")
    assert_equal  2, invoice_items_repo.find_all_by_quantity("6").map{|invoice_item| invoice_item.id}.count
  end

  def test_it_can_find_by_unit_price
    invoice_items_repo = InvoiceItemsRepository.new(nil,"./fixtures/invoice_items.csv")
    assert_equal "6", invoice_items_repo.find_by_unit_price("52100").id
  end

  def test_it_can_find_all_by_unit_price
    invoice_items_repo = InvoiceItemsRepository.new(nil,"./fixtures/invoice_items.csv")
    assert_equal  2, invoice_items_repo.find_all_by_unit_price("1859").map{|invoice_item| invoice_item.id}.count
  end

  def test_it_can_find_by_created_at
    invoice_items_repo = InvoiceItemsRepository.new(nil,"./fixtures/invoice_items.csv")
    assert_equal "1", invoice_items_repo.find_by_created_at("2012-03-27 14:54:09 UTC").id
  end

  def test_it_can_find_all_by_created_at
    invoice_items_repo = InvoiceItemsRepository.new(nil,"./fixtures/invoice_items.csv")
    assert_equal 9, invoice_items_repo.find_all_by_created_at("2012-03-27 14:54:09 UTC").map{|invoice_item| invoice_item.id}.count
  end


  def test_it_can_find_by_updated_at
    invoice_items_repo = InvoiceItemsRepository.new(nil,"./fixtures/invoice_items.csv")
    assert_equal "7", invoice_items_repo.find_by_updated_at("2012-03-27 14:54:10 UTC").id
  end


  def test_it_can_find_all_by_updated_at
    invoice_items_repo = InvoiceItemsRepository.new(nil,"./fixtures/invoice_items.csv")
    assert_equal 2, invoice_items_repo.find_all_by_updated_at("2012-03-27 14:54:10 UTC").map{|invoice_item| invoice_item.id}.count
  end
end



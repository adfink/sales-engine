require 'minitest/pride'
require 'minitest/autorun'
require './lib/invoices_repository'

class InvoicessRepositoryTest < MiniTest::Test

  def test_that_it_exists
    invoice_repo = InvoicesRepository.new(nil, "./data/invoices.csv")
    assert invoice_repo
  end

  def test_that_it_can_find_the_file_to_read
    invoice_repo = InvoicesRepository.new(nil, "./data/invoices.csv")
    assert invoice_repo.check_for_file
  end

  def test_that_it_stores_its_data_in_an_array
    invoice_repo = InvoicesRepository.new(nil, "./data/invoices.csv")
    refute invoice_repo.invoices.empty?
    assert_equal Array, invoice_repo.invoices.class
  end

  def test_that_it_can_return_all_instances_of_repo
    invoice_repo = InvoicesRepository.new(nil, "./data/invoices.csv")
    assert_equal 4843, invoice_repo.all.length
  end

  def test_that_it_can_output_a_single_random_instance
    invoice_repo = InvoicesRepository.new(nil, "./data/invoices.csv")
    assert invoice_repo.all.include?(invoice_repo.random)
  end

  def test_it_can_find_by_id
    invoice_repo = InvoicesRepository.new(nil, "./data/invoices.csv")
    assert_equal "1", invoice_repo.find_by_id("1").customer_id
  end

  def test_it_can_find_all_by_customer_id
    invoice_repo = InvoicesRepository.new(nil, "./data/invoices.csv")
    assert_equal ["1", "2", "3", "4", "5", "6", "7", "8"], invoice_repo.find_all_by_customer_id("1").map{|invoice| invoice.id}
    assert_equal [], invoice_repo.find_all_by_customer_id("5").map{|invoice| invoice.id}
  end

  def test_it_can_find_by_customer_id
    invoice_repo = InvoicesRepository.new(nil, "./data/invoices.csv")
    assert_equal "1", invoice_repo.find_by_customer_id("1").id
  end

  def test_it_can_find_all_by_merchant_id
    invoice_repo = InvoicesRepository.new(nil, "./data/invoices.csv")
    assert_equal 50, invoice_repo.find_all_by_merchant_id("100").map{|invoice| invoice.status}.length
    assert_equal [], invoice_repo.find_all_by_merchant_id("300").map{|invoice| invoice.status}
  end

  def test_it_can_find_by_merchant_id
    invoice_repo = InvoicesRepository.new(nil, "./data/invoices.csv")
    assert_equal "shipped", invoice_repo.find_by_merchant_id("100").status
  end

  def test_it_can_find_by_status
    invoice_repo = InvoicesRepository.new(nil, "./data/invoices.csv")
    assert_equal "1", invoice_repo.find_by_status("shipped").id
  end

  def test_it_can_find_all_by_status
    invoice_repo = InvoicesRepository.new(nil, "./data/invoices.csv")
    assert_equal 4843, invoice_repo.find_all_by_status("shipped").map{|invoice| invoice.id}.length
  end

  def test_it_can_find_all_by_created_at
    invoice_repo = InvoicesRepository.new(nil, "./data/invoices.csv")
    assert_equal ["1"], invoice_repo.find_all_by_created_at("2012-03-25 09:54:09 UTC").map{|customer| customer.id}
    assert_equal [], invoice_repo.find_all_by_created_at("2015-03-25 09:54:09 UTC").map{|invoice| invoice.id}
  end

  def test_it_can_find_by_created_at
    invoice_repo = InvoicesRepository.new(nil, "./data/invoices.csv")
    assert_equal "1", invoice_repo.find_by_created_at("2012-03-25 09:54:09 UTC").id
  end

  def test_it_can_find_all_by_updated_at
    invoice_repo = InvoicesRepository.new(nil, "./data/invoices.csv")
    assert_equal ["1"], invoice_repo.find_all_by_updated_at("2012-03-25 09:54:09 UTC").map{|customer| customer.id}
    assert_equal [], invoice_repo.find_all_by_updated_at("2015-03-25 09:54:09 UTC").map{|customer| customer.id}
  end

  def test_it_can_find_by_updated_at
    invoice_repo = InvoicesRepository.new(nil, "./data/invoices.csv")
    assert_equal "1", invoice_repo.find_by_updated_at("2012-03-25 09:54:09 UTC").id
  end
end

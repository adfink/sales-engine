require './lib/merchants_repository'
require './lib/invoices_repository'
require './lib/items_repository'
require './lib/invoice_items_repository'
require './lib/customers_repository'
require './lib/transactions_repository'

class Engine
  attr_reader :merchants_repository,
              :invoices_repository,
              :items_repository,
              :invoice_items_repository,
              :customers_repository,
              :transactions_repository
              :dir

  def initialize(dir)
    @dir = dir
  end

  def startup
    @merchants_repository     = MerchantsRepository.new(self, "#{@dir}/merchants.csv")
    @invoices_repository      = InvoicesRepository.new(self, "#{@dir}/invoices.csv")
    @items_repository         = ItemsRepository.new(self, "#{@dir}/items.csv")
    @invoice_items_repository = InvoiceItemsRepository.new(self, "#{@dir}/invoices.csv")
    @customers_repository     = CustomersRepository.new(self, "#{@dir}/customers.csv")
    @transactions_repository  = TransactionsRepository.new(self, "#{@dir}/transactions.csv")
  end


  def find_all_items_by_merchant_id(merchant_id)
    @items_repository.find_all_by_merchant_id(merchant_id)
  end

<
  def find_all_invoices_by_merchant_id(merchant_id)
    @invoices_repository.find_all_by_merchant_id(merchant_id)
  end

  def find_all_transactions_by_invoice_id(invoice_id)
    @transactions_repository.find_all_by_invoice_id(invoice_id)
  end

  def find_all_items_by_invoice_id(invoice_id)
    invoice_items = @invoice_items_repository.find_all_by_invoice_id(invoice_id)
    item_ids = invoice_items.map{|item| item.item_id}
    @items_repository.get_items(item_ids)
  end

  def find_customer_by_customer_id(customer_id)
    @customers_repository.find_by_id(customer_id)
  end

  def find_merchant_by_merchant_id(merchant_id)
    @merchants_repository.find_by_id(merchant_id)
  end

  def find_invoice_by_invoice_id(invoice_id)
    @invoices_repository.find_by_id(invoice_id)
  end

  def find_item_by_item_id(item_id)
    @items_repository.find_by_id(item_id)
  end

  def find_all_invoice_items_by_item_id(item_id)
    @invoice_items_repository.find_all_by_item_id(item_id)
  end

  def find_all_invoices_by_customer_id(customer_id)
    @invoices_repository.find_all_by_customer_id(customer_id)
  end

  def find_all_invoice_items_by_invoice_id(invoice_id)
    @invoice_items_repository.find_all_by_invoice_id(invoice_id)
  end
end

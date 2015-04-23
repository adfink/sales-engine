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

  def initialize(repository)
    @repository = repository
  end

  def startup
    @merchants_repository     = MerchantsRepository.new(self)
    @invoices_repository      = InvoicesRepository.new(self)
    @items_repository         = ItemsRepository.new(self)
    @invoice_items_repository = InvoiceItemsRepository.new(self)
    @customers_repository     = CustomersRepository.new(self)
    @transactions_repository  = TransactionsRepository.new(self)
  end
end

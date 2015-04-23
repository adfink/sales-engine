class Engine
  attr_reader :merchant_repository,
              :invoice_repository,
              :items_repository,
              :invoice_item_repository,
              :customer_repository,
              :transaction_repository

  def initialize(repository)
    @repository = repository
  end

  def startup
    @merchant_repository     = MerchantRepository.new(self)
    @invoice_repository      = InvoiceRepository.new(self)
    @items_repository        = ItemsRepository.new(self)
    @invoice_item_repository = InvoiceItemRepository.new(self)
    @customer_repository     = CustomerRepository.new(self)
    @transaction_repository  = TransactionRepository.new(self)
  end
end

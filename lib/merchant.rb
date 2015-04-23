class Merchant
attr_accessor :id, :name, :created_at, :updated_at

  def initialize(row, repository)
    @repository = repository
    @id         = row[:id]
    @name       = row[:name]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
  end

  def global_engine
    @repository.engine
  end

  def items
    item_repo = global_engine.item_repository
    item_repo.find_by_merchant_id(self.id)
  end

  def invoice
    invoice_repo = global_engine.invoice_repository
    invoice_repo = find_by_merchant_id(self.id)
  end
end

Merchant.global_engine #self.global_engine

m = Merchant.new #global_engine
m.global_engine

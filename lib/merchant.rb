require_relative 'merchants_repository'

class Merchant
attr_accessor :id, :name, :created_at, :updated_at

  def initialize(row, repository)
    @repository = repository
    @id         = row[:id]
    @name       = row[:name]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
  end

  def inspect
    "merchant number #{id}"
  end

  def items
    @repository.find_all_items_by_merchant_id(:id)
  end

  def invoices
    @repository.find_all_invoices_by_merchand_id(:id)
  end
end

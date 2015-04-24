require_relative 'invoice_items_repository'

class InvoiceItem
  attr_accessor :id,
                :item_id,
                :invoice_id,
                :quantity,
                :unit_price,
                :created_at,
                :updated_at,
                :row

  def initialize(row, repository)
    @row = row
    @repository = repository
    @id         = row[:id]
    @item_id    = row[:item_id]
    @invoice_id = row[:invoice_id]
    @quantity   = row[:quantity]
    @unit_price = row[:unit_price]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
  end

  def inspect
    "invoice item number #{id}"
  end

  def invoice
    @repository.find_invoice_by_invoice_id(id)
  end

  def item
    @repository.find_item_by_item_id(id)
  end

  def total_cost
    quantity.to_i * unit_price.to_i
  end
end

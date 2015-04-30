require_relative 'invoice_item_repository'

class InvoiceItem
  attr_accessor :id,
                :item_id,
                :invoice_id,
                :quantity,
                :unit_price,
                :created_at,
                :updated_at,
                :row

  attr_reader   :repository

  def initialize(row, repository)
    @row = row
    @repository = repository
    @id         = row[:id].to_i
    @item_id    = row[:item_id].to_i
    @invoice_id = row[:invoice_id].to_i
    @quantity   = row[:quantity].to_i
    @unit_price = row[:unit_price].to_i
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
  end

  def inspect
    "invoice item number #{id}"
  end

  def invoice
    repository.find_invoice_by_invoice_id(invoice_id)
  end

  def item
    repository.find_item_by_item_id(item_id)
  end

  def total_cost
    quantity.to_i * unit_price.to_i
  end

  def attached_to_successful_invoice?
    repository.am_i_successful?(invoice_id)
  end
end

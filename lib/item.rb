require './lib/items_repository'

class Item
attr_accessor :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at

  def initialize(row, repository)
    @repository  = repository
    @id          = row[:id]
    @name        = row[:name]
    @description = row[:description]
    @unit_price  = row[:unit_price]
    @merchant_id = row[:merchant_id]
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
  end

  def inspect
    "item number #{id}"
  end

  def invoice_items
    @repository.find_all_invoice_items_by_item_id(id)
  end
end

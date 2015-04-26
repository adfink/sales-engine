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

  def best_day
    invoices = invoice_items.map{|invoice_item| invoice_item.invoice}
    invoices_by_date = invoices.group_by{|invoice| invoice.created_at}
    invoices_by_date.map{|k, v| [v.size, k[0..9]]}.sort[-1][-1]
  end

  # trying to take into account invoice item quantity when calculating best day
    # Need to confirm with instructor(s) how this method should be constructed
  def best_day_fake
    # find all invoice items associated with this item object --> array
    # find all invoices associated with each invoice item --> array
    total_invoice_items = invoice_items.map{|invoice_item| invoice_item * invoice_item.quantity}
    invoices = total_invoice_items.map{|invoice_item| invoice_item.invoice}
    # group by created at date --> hash {created_at date => number of times it appears}
    invoices_by_date = invoices.group_by{|invoice| invoice.created_at}
    # sort the hash based on number of invoices per date
    invoices_by_date.map{|k, v| [v.size, k[0..9]]}.sort[-1][-1]
  end

  def find_invoice_items(id)
    @repository.find_all_invoice_items_by_item_id(id)
  end


  def revenue
    @repository.find_item_revenue(id)
  end
end

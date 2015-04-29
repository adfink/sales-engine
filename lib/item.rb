require_relative 'item_repository'
require 'date'

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
    @id          = row[:id].to_i
    @name        = row[:name]
    @description = row[:description]
    @unit_price  = row[:unit_price].to_i
    @merchant_id = row[:merchant_id].to_i
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
  end

  def inspect
    "item number #{id}"
  end

  def merchant
    @repository.find_merchant(merchant_id)
  end

  def invoice_items
    @repository.find_all_invoice_items_by_item_id(id)
  end

  def best_day
    invoices = invoice_items.map{|invoice_item| invoice_item.invoice}
    invoices_by_date = invoices.group_by{|invoice| invoice.created_at}
    day = invoices_by_date.map{|k, v| [v.size, k]}.sort[-1][-1]
    Date.parse(day)
  end

  def find_invoice_items(id)
    @repository.find_all_invoice_items_by_item_id(id)
  end

  def revenue
    @repository.find_item_revenue(id)
  end

  def number_of_sales
    @repository.find_item_sales_number(id)
  end
end

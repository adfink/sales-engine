require './lib/merchants_repository'
require './lib/invoices_repository'
require './lib/items_repository'
require './lib/invoice_items_repository'
require './lib/customers_repository'
require './lib/transactions_repository'
require 'bigdecimal'
require 'bigdecimal/util'
require 'pry'

class Engine
  attr_reader :invoices_repository,
              :items_repository,
              :invoice_items_repository,
              :customers_repository,
              :transactions_repository,
              :merchants_repository
              :dir

  def initialize(dir)
    @dir = dir
  end

  def startup
    @merchants_repository     = MerchantsRepository.new(self, "#{@dir}/merchants.csv")
    @invoices_repository      = InvoicesRepository.new(self, "#{@dir}/invoices.csv")
    @items_repository         = ItemsRepository.new(self, "#{@dir}/items.csv")
    @invoice_items_repository = InvoiceItemsRepository.new(self, "#{@dir}/invoice_items.csv")
    @customers_repository     = CustomersRepository.new(self, "#{@dir}/customers.csv")
    @transactions_repository  = TransactionsRepository.new(self, "#{@dir}/transactions.csv")
  end

  def find_all_items_by_merchant_id(merchant_id)
    @items_repository.find_all_by_merchant_id(merchant_id)
  end

  def find_all_invoices_by_merchant_id(merchant_id)
    @invoices_repository.find_all_by_merchant_id(merchant_id)
  end

  def find_all_transactions_by_invoice_id(invoice_id)
    @transactions_repository.find_all_by_invoice_id(invoice_id)
  end

  def find_all_items_by_invoice_id(invoice_id)
    @invoice_items_repository.find_all_by_invoice_id(invoice_id).map{|item| item.item_id}.map{|id| @items_repository.find_by_id(id)}
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


  def find_successful_invoices_by_merchant_id(merchant_id)
    find_all_invoices_by_merchant_id(merchant_id)
      .select{|invoice| invoice.successful?}
  end


  def revenue_of_merchant_by_id(merchant_id)
    (find_all_invoices_by_merchant_id(merchant_id).select{|invoice| invoice.successful?}.map do |invoice|
        find_all_invoice_items_by_invoice_id(invoice.id).map(&:total_cost).inject(:+) || 0
    end.inject(:+).to_d/100).round(2).to_digits
  end

  def is_this_invoice_successful?(invoice_id)
    @transactions_repository.find_all_by_invoice_id(invoice_id).any? {|transaction|  transaction.result == "success"}
  end

  def find_successful_invoices(invoices)
    invoices.select{|invoice| invoice.successful?}
  end

  def find_customer_for_each_successful_invoice
    find_successful_invoices.map{|invoice| invoice.customer_id}
  end


  def find_this_items_revenue(item_id)

   invoice_items = invoice_items_repository.find_all_by_item_id(item_id)

    good_invoice_items = invoice_items.select{|invoice_item| invoice_item.attached_to_successful_invoice?(invoice_item.id)}

   good_invoice_items.map {|invoice_item| invoice_item.total_cost}.reduce(:+) || 0


  end


  def find_this_items_sales_number(item_id)

    invoice_items = invoice_items_repository.find_all_by_item_id(item_id)

    good_invoice_items = invoice_items.select{|invoice_item| invoice_item.attached_to_successful_invoice?(invoice_item.id)}

    good_invoice_items.map {|invoice_item| invoice_item.quantity.to_i}.reduce(:+) || 0

  end

  # come back to review flat_map if seeing issues
  def revenue_by_merchant_id_and_invoice_date(merchant_id, date)
    successful_invoices_by_date = find_successful_invoices_by_merchant_id(merchant_id).find_all{|invoice| invoice.created_at.to_s[0..9] == date[0..9]}
    invoice_items = successful_invoices_by_date.flat_map{|invoice| @invoice_items_repository.find_all_by_invoice_id(invoice.id)}
    revenues = invoice_items.map{|invoice_item| invoice_item.total_cost}
    revenues.reduce(:+) || 0
  end

  def add_items(items, invoice_id)
    invoice_items_repository.add_items(items, invoice_id)
  end

  def charge(inputs, invoice_id)
    transactions_repository.charge(inputs, invoice_id)
  end
end
























#
#
#
# def get_invoice_items(array_of_successful_invoices)
#   array_of_successful_invoices.map {|invoice| find_all_invoice_items_by_invoice_id(invoice.id)}
#
#
# end
#
# def get_revenue(array_of_successful_invoice_items)
#   array_of_successful_invoice_items.flat_map{|invoice_item| invoice_item.total_cost}.inject(:+) || 0 .inject(:+)
#   # .to_d/100).round(2).to_digits
#
# end
#
#


#
#
# # def revenue_of_merchant_by_id(merchant_id)
# #   invoice_items = get_invoice_items(find_successful_invoices_by_merchant_id(merchant_id))
# #
# #   get_revenue(invoice_items)
# #
# #   binding.pry
# # end
#
#
# def revenue_by_merchant_id_and_invoice_date(merchant_id, date)
#   (find_all_invoices_by_merchant_id(merchant_id).select{|invoice| invoice.successful?}.select{|invoice| invoice.created_at[0..9] == date} || 0.map do |invoice|
#     binding.pry
#     find_all_invoice_items_by_invoice_id(invoice.id).map(&:total_cost).inject(:+) || 0
#   end.inject(:+).to_d/100).round(2).to_digits
# end
#
# # def revenue_by_merchant_id_and_invoice_date(merchant_id, date)
# #
# #   find_all_invoices_by_merchant_id(merchant_id).select{|invoice| invoice.successful?}.select{|invoice| invoice.created_at[0..9] == date}
# #
# # end

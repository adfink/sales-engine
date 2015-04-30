require_relative 'merchant_repository'
require_relative 'invoice_repository'
require_relative 'item_repository'
require_relative 'invoice_item_repository'
require_relative 'customer_repository'
require_relative 'transaction_repository'
require 'bigdecimal'
require 'bigdecimal/util'
require 'pry'

class SalesEngine
  attr_reader :invoice_repository,
              :item_repository,
              :invoice_item_repository,
              :customer_repository,
              :transaction_repository,
              :merchant_repository
              :dir

  def initialize(dir)
    @dir = dir
  end

  def startup
    @merchant_repository     = MerchantRepository
       .new(self, "#{@dir}/merchants.csv")
    @invoice_repository      = InvoiceRepository
       .new(self, "#{@dir}/invoices.csv")
    @item_repository         = ItemRepository
       .new(self, "#{@dir}/items.csv")
    @invoice_item_repository = InvoiceItemRepository
       .new(self, "#{@dir}/invoice_items.csv")
    @customer_repository     = CustomerRepository
       .new(self, "#{@dir}/customers.csv")
    @transaction_repository  = TransactionRepository
       .new(self, "#{@dir}/transactions.csv")
  end

  def find_all_items_by_merchant_id(merchant_id)
    @item_repository.find_all_by_merchant_id(merchant_id)
  end

  def find_all_invoices_by_merchant_id(merchant_id)
    @invoice_repository.find_all_by_merchant_id(merchant_id)
  end

  def find_all_transactions_by_invoice_id(invoice_id)
    @transaction_repository.find_all_by_invoice_id(invoice_id)
  end

  def find_customer_by_customer_id(customer_id)
    @customer_repository.find_by_id(customer_id)
  end

  def find_merchant_by_merchant_id(merchant_id)
    @merchant_repository.find_by_id(merchant_id)
  end

  def find_invoice_by_invoice_id(invoice_id)
    @invoice_repository.find_by_id(invoice_id)
  end

  def find_item_by_item_id(item_id)
    @item_repository.find_by_id(item_id)
  end

  def find_all_invoice_items_by_item_id(item_id)
    @invoice_item_repository.find_all_by_item_id(item_id)
  end

  def find_all_invoices_by_customer_id(customer_id)
    @invoice_repository.find_all_by_customer_id(customer_id)
  end

  def find_all_invoice_items_by_invoice_id(invoice_id)
    @invoice_item_repository.find_all_by_invoice_id(invoice_id)
  end

  def find_successful_invoices(invoices)
    invoices.select{|invoice| invoice.successful?}
  end

  def find_customer_for_each_successful_invoice
    find_successful_invoices.map{|invoice| invoice.customer_id}
  end

  def find_successful_invoices_by_merchant_id(merchant_id)
    find_all_invoices_by_merchant_id(merchant_id)
      .select{|invoice| invoice.successful?}
  end

  def find_all_items_by_invoice_id(invoice_id)
    @invoice_item_repository.find_all_by_invoice_id(invoice_id).map{|item|
      item.item_id
    }.map{|id|
      @item_repository.find_by_id(id)
    }
  end

  def revenue_of_merchant_by_id(merchant_id)
    find_all_invoices_by_merchant_id(merchant_id).select{|invoice|
      invoice.successful?
    }.map do |invoice|
        find_all_invoice_items_by_invoice_id(invoice.id)
          .map(&:total_cost).inject(:+) || 0
    end.inject(:+).to_d/100
  end

  def is_this_invoice_successful?(invoice_id)
    @transaction_repository
      .find_all_by_invoice_id(invoice_id).any? {|transaction|
      transaction.result == "success"}
  end

  def find_this_items_revenue(item_id)
    find_items_based_on(item_id, :total_cost)
  end

  def find_this_items_sales_number(item_id)
    find_items_based_on(item_id, :quantity)
  end

  def find_items_based_on(item_id, criteria)
    invoice_items = invoice_item_repository.find_all_by_item_id(item_id)
    good_invoice_items = invoice_items.select{|invoice_item|
      invoice_item.attached_to_successful_invoice?
    }
    good_invoice_items.map {|invoice_item|
      invoice_item.send(criteria)
    }.reduce(:+) || 0
  end

  def revenue_by_merchant_id_and_invoice_date(merchant_id, date)
    successful_invoices = find_successful_invoices_by_merchant_id(merchant_id)
       .find_all{|invoice|
      invoice.created_at.to_s[0..9] == date[0..9]
    }
    invoice_items = successful_invoices.flat_map{|invoice|
      @invoice_item_repository.find_all_by_invoice_id(invoice.id)
    }
    revenues = invoice_items.map{|invoice_item|
      invoice_item.total_cost
    }
    (revenues.reduce(:+) || 0).to_d/100
  end

  def add_items(items, invoice_id)
    invoice_item_repository.add_items(items, invoice_id)
  end

  def charge(inputs, invoice_id)
    transaction_repository.charge(inputs, invoice_id)
  end

  def find_merchant_for_each_successful_invoice(successful_invoices)
    @invoice_repository
      .find_merchant_for_each_successful_invoice(successful_invoices)
  end
end

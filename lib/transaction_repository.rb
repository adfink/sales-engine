require 'csv'
require_relative 'transactions'
require_relative 'sales_engine'

class TransactionRepository
attr_reader :transactions

  def initialize(engine, filepath)
    @engine = engine
    @transactions = generate_transactions(filepath)
    @successful_transactions = find_all_by_result("success")
  end

  def inspect
    "transaction repository containing #{@transactions.count} items"
  end

  def generate_transactions(filepath)
    file_contents = CSV.open filepath, headers: true, header_converters: :symbol
    file_contents.map{|row| Transactions.new(row, self)}
  end

  def check_for_file
    File.exist?"./data/transactions.csv"
  end

  def output_file_contents
    File.read("data/transactions.csv")
  end

  def all
    @transactions
  end

  def random
    @transactions.sample
  end

  def find_by_id(number)
    @transactions.find do |transaction|
      transaction.id == number
    end
  end

  def find_by_invoice_id(number)
    @transactions.find do |transaction|
      transaction.invoice_id == number
    end
  end

  def find_all_by_invoice_id(number)
    @transactions.find_all do |transaction|
      transaction.invoice_id == number
    end
  end

  def find_by_credit_card_number(number)
    @transactions.find do |transaction|
      transaction.credit_card_number == number
    end
  end

  def find_all_by_credit_card_number(number)
    @transactions.find_all do |transaction|
      transaction.credit_card_number == number
    end
  end

  def find_by_created_at(time)
    @transactions.find do |transaction|
      transaction.created_at.to_s == time
    end
  end

  def find_all_by_created_at(time)
    @transactions.find_all do |transaction|
      transaction.created_at.to_s == time
    end
  end

  def find_by_updated_at(time)
    @transactions.find do |transaction|
      transaction.updated_at.to_s == time
    end
  end

  def find_all_by_updated_at(time)
    @transactions.find_all do |transaction|
      transaction.updated_at.to_s == time
    end
  end

  def find_by_result(result)
    @transactions.find do |transaction|
      transaction.result.to_s == result
    end
  end

  def find_all_by_result(result)
    @transactions.find_all do |transaction|
      transaction.result.to_s == result
    end
  end

  def find_invoice_by_invoice_id(invoice_id)
    @engine.find_invoice_by_invoice_id(invoice_id)
  end

  def charge(inputs, invoice_id)
    data = {
      id:                 next_id,
      invoice_id:         invoice_id,
      credit_card_number: inputs[:credit_card_number],
      result:             inputs[:result],
      created_at:         Time.now.to_s,
      updated_at:         Time.now.to_s
    }

    transaction = Transactions.new(data, self)

    @transactions << transaction
    transaction
  end

  def next_id
    @transactions.last.id.to_i + 1
  end
end





require 'csv'
require './lib/transactions'
require './lib/engine'

class TransactionsRepository
attr_reader :transactions

  def initialize(engine, filepath)
    @engine = engine
    @transactions = generate_transactions(filepath)
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
    @transactions.find {|transaction| transaction.id == number}
  end

  def find_by_invoice_id(number)
    @transactions.find {|transaction| transaction.invoice_id == number}
  end

  def find_all_by_invoice_id(number)
    @transactions.find_all {|transaction| transaction.invoice_id == number}
  end

  def find_by_credit_card_number(number)
    @transactions.find {|transaction| transaction.credit_card_number == number}
  end

  def find_all_by_credit_card_number(number)
    @transactions.find_all {|transaction| transaction.credit_card_number == number}
  end

  def find_by_created_at(time)
    @transactions.find {|transaction| transaction.created_at.to_s == time}
  end

  def find_all_by_created_at(time)
    @transactions.find_all {|transaction| transaction.created_at.to_s == time}
  end

  def find_by_updated_at(time)
    @transactions.find {|transaction| transaction.updated_at.to_s == time}
  end

  def find_all_by_updated_at(time)
    @transactions.find_all {|transaction| transaction.updated_at.to_s == time}
  end

  def find_by_result(result)
    @transactions.find {|transaction| transaction.result.to_s == result}
  end

  def find_all_by_result(result)
    @transactions.find_all {|transaction| transaction.result.to_s == result}
  end

  def find_invoice_by_invoice_id(invoice_id)
    @engine.find_invoice_by_invoice_id(invoice_id)
  end
end





require 'csv'
require_relative 'transactions'

class TransactionsRepository
attr_reader :transactions

  def initialize
    file_contents = CSV.open "./data/transactions.csv", headers: true, header_converters: :symbol
    @transactions = []
    file_contents.each do |row|
      transaction = Transactions.new
      transaction.id = row[:id]
      transaction.invoice_id = row[:invoice_id]
      transaction.credit_card_number = row[:credit_card_number]
      transaction.created_at = row[:created_at]
      transaction.updated_at = row[:updated_at]
      transaction.credit_card_expiration_date = row[:credit_card_expiration_date]
      transaction.result = row[:result]
      @transactions << transaction
    end
  end

  def check_for_file
    File.exist?"./data/transactions.csv"
  end

  def output_file_contents
    contents = File.read("data/transactions.csv")
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




end



#
#
#

#
# def find_by_first_name(first_name)
#   @transactions.find {|transaction| transaction.first_name == first_name}
# end
#
# def find_all_by_first_name(first_name)
#   @transactions.find_all {|transaction| transaction.first_name == first_name}
# end
#
# def find_by_last_name(last_name)
#   @transactions.find {|transaction| transaction.last_name == last_name}
# end
#
# def find_all_by_last_name(last_name)
#   @transactions.find_all {|transaction| transaction.last_name == last_name}
# end
#
# def find_by_created_at(time)
#   @transactions.find {|transaction| transaction.created_at.to_s == time}
# end
#
# def find_all_by_created_at(time)
#   @transactions.find_all {|transaction| transaction.created_at.to_s == time}
# end
#
# def find_by_updated_at(time)
#   @transactions.find {|transaction| transaction.updated_at.to_s == time}
# end
#
# def find_all_by_updated_at(time)
#   @transactions.find_all {|transaction| transaction.updated_at.to_s == time}
# end
# end

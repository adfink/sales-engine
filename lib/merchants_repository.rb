require 'csv'
require_relative 'merchant'

class MerchantsRepository
attr_reader :merchants, :engine

  def initialize(engine)
    @engine = engine
    file_contents = CSV.open "./data/merchants.csv", headers: true, header_converters: :symbol
    @merchants = []
    file_contents.each do |row|
      merchant = Merchant.new(row, self)
      @merchants << merchant
    end
  end

  def check_for_file
    File.exist?"./data/merchants.csv"
  end

  def output_file_contents
    File.read"./data/merchants.csv"
  end

  def all
    @merchants
  end

  def random
    @merchants.sample
  end

  def find_by_id(number)
    @merchants.find {|merchant| merchant.id == number}
  end

  def find_by_name(name)
    @merchants.find {|merchant| merchant.name == name}
  end

  def find_all_by_name(name)
    @merchants.find_all {|merchant| merchant.name == name}
  end

  def find_by_created_at(time)
    @merchants.find {|merchant| merchant.created_at.to_s == time}
  end

  def find_all_by_created_at(time)
    @merchants.find_all {|merchant| merchant.created_at.to_s == time}
  end

  def find_by_updated_at(time)
    @merchants.find {|merchant| merchant.updated_at.to_s == time}
  end

  def find_all_by_updated_at(time)
    @merchants.find_all {|merchant| merchant.updated_at.to_s == time}
  end
end

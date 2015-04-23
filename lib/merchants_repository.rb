require 'csv'
require './lib/merchant'
require './lib/engine'

class MerchantsRepository
attr_reader :merchants, :engine

  def initialize(engine, filepath)
    @engine = engine
    @merchants = generate_merchants(filepath)
  end

  def generate_merchants(filepath)
    output = CSV.open filepath, headers: true, header_converters: :symbol
    output.map {|row| Merchant.new(row, self)}
  end

  def check_for_file(filepath)
    File.exist?(filepath)
  end

  def output_file_contents(filepath)
    File.read(filepath)
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














  def find_all_items_by_merchant_id(merchant_id)
    @engine.find_all_items_by_merchant_id(merchant_id)
  end





end

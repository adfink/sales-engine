require 'csv'
require './lib/item'
# require './lib/engine'

class ItemsRepository
  attr_reader :items, :engine

  def initialize(engine)
    @engine = engine
    file_contents = CSV.open "./data/items.csv", headers: true, header_converters: :symbol
    @items = []
    file_contents.each do |row|
      item = Item.new(row, self)
      @items << item
    end
  end

  def output_file_contents
    File.read"./data/items.csv"
  end

  def all
    @items
  end

  def random
    @items.sample
  end

  def find_by_id(number)
    @items.find {|item| item.id == number}
  end

  def find_by_name(name)
    @items.find {|item| item.name == name}
  end

  def find_all_by_name(name)
    @items.find_all {|item| item.name == name}
  end

  def find_by_description(description)
    @items.find {|item| item.description == description}
  end

  def find_all_by_description(description)
    @items.find_all {|item| item.description == description}
  end

  def find_by_unit_price(price)
    @items.find {|item| item.unit_price == price}
  end

  def find_all_by_unit_price(price)
    @items.find_all {|item| item.unit_price == price}
  end

  def find_by_merchant_id(merchant)
    @items.find {|item| item.merchant_id == merchant}
  end

  def find_all_by_merchant_id(merchant)
    @items.find_all {|item| item.merchant_id == merchant}
  end

  def find_by_created_at(time)
    @items.find {|item| item.created_at.to_s == time}
  end

  def find_all_by_created_at(time)
    @items.find_all {|item| item.created_at.to_s == time}
  end

  def find_by_updated_at(time)
    @items.find {|item| item.updated_at.to_s == time}
  end

  def find_all_by_updated_at(time)
    @items.find_all {|item| item.updated_at.to_s == time}
  end
end


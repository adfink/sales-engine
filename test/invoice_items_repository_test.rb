gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_items_repository.rb'

class InvoiceItemsRepositoryTest < Minitest::Test

  def test_there_is_a_merchants_repo
    repo = InvoiceItemsRepository.new
  end

end

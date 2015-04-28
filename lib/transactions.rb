require_relative 'transaction_repository'

class Transactions
  attr_accessor :id,
                :invoice_id,
                :credit_card_number,
                :credit_card_expiration_date,
                :created_at,
                :updated_at,
                :result

  def initialize(row, repository)
    @repository                  = repository
    @id                          = row[:id].to_i
    @invoice_id                  = row[:invoice_id].to_i
    @credit_card_number          = row[:credit_card_number]
    @created_at                  = row[:created_at]
    @updated_at                  = row[:updated_at]
    @credit_card_expiration_date = row[:credit_card_expiration_date]
    @result                      = row[:result]
  end

  def inspect
    "transaction number #{id}"
  end

  def invoice
    @repository.find_invoice_by_invoice_id(invoice_id)
  end
end

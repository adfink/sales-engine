class Transactions
  attr_accessor :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :created_at, :updated_at, :result

  def initialize
    @id
    @invoice_id
    @credit_card_number
    @credit_card_expiration_date
    @result
    @created_at
    @updated_at
  end
end

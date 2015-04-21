class TransactionsRepository

  def get_info_from_csv
    contents = File.read("data/transactions.csv")
    p contents
  end

end

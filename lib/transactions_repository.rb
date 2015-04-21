class TransactionsRepository

  def check_for_file
    File.exist?"./data/transactions.csv"
  end
end

class TransactionsRepository

  def check_for_file
    File.exist?"./data/transactions.csv"
  end

  def get_info_from_csv
    contents = File.read("data/transactions.csv")
    p contents
  end
end

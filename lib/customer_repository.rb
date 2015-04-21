class CustomerRepository

  def check_for_file
    File.exist? "./data/customers.csv"
  end
end

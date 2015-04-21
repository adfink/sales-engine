class CustomerRepository

  def check_for_file
    File.exist? "./data/customers.csv"
  end

  def output_file_contents
    contents = File.read "./data/customers.csv"
    puts contents
  end
end

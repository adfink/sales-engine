class CustomerRepository

<<<<<<< HEAD
  def locate_data_file
    File.exist?"./data/customers.csv"
  end

  def output_file_contents
    contents = File.read"./data/customers.csv"
=======
  def check_for_file
    File.exist? "./data/customers.csv"
  end

  def output_file_contents
    contents = File.read "./data/customers.csv"
>>>>>>> b6f86039a688d0f5914c4e4a50cde1e63b36b432
    puts contents
  end
end

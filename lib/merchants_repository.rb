class MerchantsRepository

  def find_file
    File.exist?"./data/merchants.csv"
  end

  def output_file_contents
    contents = File.read"./data/merchants.csv"
    puts contents
  end
end

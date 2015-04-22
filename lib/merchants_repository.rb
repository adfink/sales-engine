class MerchantsRepository

  def check_for_file
    File.exist?"./data/merchants.csv"
  end

  def output_file_contents
    contents = File.read"./data/merchants.csv"
  end
end

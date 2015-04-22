class ItemsRepository

  def check_for_file
    File.exist? "./data/items.csv"
  end

  def output_file_contents
    File.read"./data/items.csv"
  end
end

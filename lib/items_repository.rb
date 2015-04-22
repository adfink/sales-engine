class ItemsRepository

  def output_file_contents
    File.read"./data/items.csv"
  end
end

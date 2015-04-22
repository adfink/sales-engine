class ItemsRepository
  def get_info_from_csv
    contents = File.read("data/items.csv")
    # p contents
  end
end

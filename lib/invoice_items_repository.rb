class InvoiceItemsRepository


  def get_info_from_csv
    contents = File.read("data/invoice_items.csv")
    # p contents
  end
end

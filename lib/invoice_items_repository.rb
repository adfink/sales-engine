class InvoiceItemsRepository

  def check_for_file
    File.exist?"./data/invoice_items.csv"
  end

  def output_file_contents
    contents = File.read"./data/invoice_items.csv"
  end
end

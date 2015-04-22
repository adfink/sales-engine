class InvoiceRepository

  def check_for_file
    File.exist? "./data/invoices.csv"
  end

  def output_file_contents
    contents = File.read "./data/invoices.csv"
  end
end

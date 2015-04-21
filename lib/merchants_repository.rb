class MerchantsRepository

  def get_info
    contents = File.read "data/merchants.csv"
    puts contents
  end

end

# repo = MerchantsRepository.new
# p repo.get_info

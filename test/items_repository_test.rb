require 'minitest/pride'
require 'minitest/autorun'
require './lib/items_repository'

class ItemsRepositoryTest < MiniTest::Test

  def test_that_it_exists
    items_repo = ItemsRepository.new(nil, "./data/items.csv")
    assert items_repo
  end

  def test_that_it_stores_its_data_in_an_array
    items_repo = ItemsRepository.new(nil, "./data/items.csv")
    refute items_repo.items.empty?
    assert_equal Array, items_repo.items.class
  end

  def test_that_it_can_return_all_instances_of_rep
    items_repo = ItemsRepository.new(nil, "./data/items.csv")
    assert_equal 2483, items_repo.all.length
  end

  def test_that_it_can_output_a_single_random_instance
    items_repo = ItemsRepository.new(nil, "./data/items.csv")
    assert items_repo.all.include?(items_repo.random)
  end

  def test_it_can_find_by_id
    items_repo = ItemsRepository.new(nil, "./data/items.csv")
    assert_equal "Item Qui Esse", items_repo.find_by_id("1").name
  end

  def test_it_can_find_all_by_name
    items_repo = ItemsRepository.new(nil, "./data/items.csv")
    assert_equal ["1"], items_repo.find_all_by_name("Item Qui Esse").map{|item| item.id}
    assert_equal [], items_repo.find_all_by_name("Max").map{|item| item.id}
  end

  def test_it_can_find_by_name
    items_repo = ItemsRepository.new(nil, "./data/items.csv")
    assert_equal "2", items_repo.find_by_name("Item Autem Minima").id
  end

  def test_it_can_find_all_by_description
    items_repo = ItemsRepository.new(nil, "./data/items.csv")
    assert_equal ["65"], items_repo.find_all_by_description("Quod exercitationem repellat mollitia possimus rerum. Hic aliquid et eum expedita. Eligendi illum earum vero ut voluptatum at ipsum. Dolorum amet aut enim dolores.").map{|item| item.id}
    assert_equal [], items_repo.find_all_by_description("Max").map{|item| item.id}
  end

  def test_it_can_find_by_description
    items_repo = ItemsRepository.new(nil, "./data/items.csv")
    assert_equal "65", items_repo.find_by_description("Quod exercitationem repellat mollitia possimus rerum. Hic aliquid et eum expedita. Eligendi illum earum vero ut voluptatum at ipsum. Dolorum amet aut enim dolores.").id
  end

  def test_it_can_find_all_by_unit_price
    items_repo = ItemsRepository.new(nil, "./data/items.csv")
    assert_equal ["1", "494"], items_repo.find_all_by_unit_price("75107").map {|item| item.id}
  end

  def test_it_can_find_by_unit_price
    items_repo = ItemsRepository.new(nil, "./data/items.csv")
    assert_equal "1", items_repo.find_by_unit_price("75107").id
  end

  def test_it_can_find_all_by_merchant_id
    items_repo = ItemsRepository.new(nil, "./data/items.csv")
    assert_equal ["16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53"], items_repo.find_all_by_merchant_id("2").map {|merchant| merchant.id}
  end

  def test_it_can_find_by_merchant_id
    items_repo = ItemsRepository.new(nil, "./data/items.csv")
    assert_equal "16", items_repo.find_by_merchant_id("2").id
  end

  def test_it_can_find_all_by_created_at
    items_repo = ItemsRepository.new(nil, "./data/items.csv")
    assert_equal ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170"], items_repo.find_all_by_created_at("2012-03-27 14:53:59 UTC").map{|item| item.id}
    assert_equal [], items_repo.find_all_by_created_at("2015-03-27 14:54:11 UTC").map{|item| item.id}
  end

  def test_it_can_find_by_created_at
    items_repo = ItemsRepository.new(nil, "./data/items.csv")
    assert_equal "1", items_repo.find_by_created_at("2012-03-27 14:53:59 UTC").id
  end

  def test_it_can_find_all_by_updated_at
    items_repo = ItemsRepository.new(nil, "./data/items.csv")
    assert_equal ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170"], items_repo.find_all_by_updated_at("2012-03-27 14:53:59 UTC").map{|item| item.id}
    assert_equal [], items_repo.find_all_by_updated_at("2015-03-27 14:53:59 UTC").map{|item| item.id}
  end

  def test_it_can_find_by_updated_at
    items_repo = ItemsRepository.new(nil, "./data/items.csv")
    assert_equal "1", items_repo.find_by_updated_at("2012-03-27 14:53:59 UTC").id
  end
end

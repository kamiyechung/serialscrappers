# frozen_string_literal: true

require 'open-uri'
require 'pry'
require 'nokogiri'

# ouverture de la page
def get_symbol_a
  liste = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  symbol_a = liste.xpath('//*[@class="text-left col-symbol"]').map { |sy|
    sy.content
  }
end

# récupération des prix dans une array
def get_value_a
  price_page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  value_a = price_page.xpath('//*[@class = "price"]').map { |pr|
    pr.content
  }
end

# récupération des infos dans un hash
def results_hash
# suppression du $
  cry_prices = get_value_a.map { |e| e.delete('$').to_f }
# création du hash
  megarray = get_symbol_a.zip(cry_prices)
  final_result_hash_a = megarray.map { |symbol, value| Hash["#{symbol}": value] }
  # h = Hash[get_symbol_a.zip(get_value_a)]
  # hash_hash = []
  # h.each { |i| hash_hash << { i[0] => i[1]} }
  # print hash_hash
end


 print results_hash

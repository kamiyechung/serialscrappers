# frozen_string_literal: true

require 'open-uri'
require 'pry'
require 'nokogiri'

# ouverture de la page
def symbol
  liste = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  liste.xpath('//*[@class="text-left col-symbol"]').each do |sy|
  cry_sym = []
  cry_sym << sy.content
 end
end

# récupération des prix dans une array
def value
  price = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  price.xpath('//*[@class = "price"]').each do |pr|
  cry_price = []
  cry_price << pr.content
  end
end

# récupération des infos dans un hash
def results_hash
  cry_sym = symbol
  cry_price = value
cry_prices = cry_price.map { |e| e.delete('$').to_f }
h = Hash[cry_sym.zip(cry_prices.map)]
hash_hash = []
h.each { |i| hash_hash << { i[0] => i[1] } }
print hash_hash
end

results_hash

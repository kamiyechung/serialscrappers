require 'rubygems'
require 'nokogiri'
require 'open-uri'page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))


#recupere les noms de cryptomonnaie et les met dans une Array

name_crypto = []

all_name_crypto = page.xpath('//*[@class="text-left col-symbol"]').each do |name|
name_crypto << name.text
end
#print name_crypto#recupere les prix de cryptomonnaie et les met dans une Array
price_crypto =  []
all_price_crypto = page.xpath('//*[@class="price"]').each do |price|
   price_crypto << price.text
   end

#regroupe les deux array en une hash

 crypto_list = Hash[name_crypto.zip(price_crypto)]
puts crypto_list
array_test = []
array_test << crypto_list
  print array_test



#    crypto_list_array = crypto_list.each do |hash|
#     array_test << hash
#    end
#    print array_test

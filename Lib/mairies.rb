require 'nokogiri'
require 'rubygems'
require 'open-uri'
require 'pry'


#Récupération d'une array avec la liste des villes
def get_townhall_urls
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  page.xpath('//a[@class = "lientxt"]').map { |town|
  town.text }
end

#Récupération d'une array avec la liste des emails associés à chaque ville
def get_townhall_email
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/"))
  news_links = page.css("a")
  news_links.map { |link|
  page_annuaire = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/#{link['href']}"))
  page_annuaire.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').map { |mail|
  mail.text }}
end

# Fusion des 2 arrays dans une hash
def megahash
megarray = get_townhall_urls.zip(get_townhall_email.flatten)

final_result_hash_a = megarray.map { |town, email| Hash["#{town}": email] }

end

def perform
    megahash
end

puts perform
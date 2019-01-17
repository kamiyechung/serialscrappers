require 'rubygems'
require 'nokogiri'
require 'open-uri'


page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
deputylist = []
links = page.xpath('//*[@class = "col3"]//li//a//@ref').each do |link|
page_links = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/#{link}"))

page_links.xpath('//*[@class="email"]').each do |email|
deputylist << email
puts deputylist
end
end

# = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
# fiche.xpath('//a[href="/deputes/fiche/OMC"]').each do |fiche|
#     fichelist = []
#     fichelist << fiche.text
# end

    
emailpage = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/fiche/"))
   emaillist = []
    emailpage.xpath('//*[@href="mailto"]').each do |email|
        emaillist << email
         end
    
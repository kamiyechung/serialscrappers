# frozen_string_literal: true

require 'open-uri'
require 'pry'
require 'nokogiri'

# ouverture de la page
def list_of_deputees
  liste = Nokogiri::HTML(open('https://www.nosdeputes.fr/deputes#A'))
  liste.xpath('//*[@class="list_nom"]').each do |deputees|
  deputee_list = []
  deputee_list << deputees.content

 end
end

hash.each do |(name, surn), value|
  puts id # prints 63
  puts time # prints Thu, 14 Jul 2016 09:01:14 UTC +00:00
  puts value # prints 3.0
end

hash

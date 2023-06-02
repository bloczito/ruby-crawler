#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'rubygems'


# URL FOR PRODUCTS. CATEGORY: TOP RATED GAMES
url_string = 'https://www.amazon.pl/s?rh=n%3A20930508031%2Cp_72%3A4-&content-id=amzn1.sym.a89ed4ff-2e3d-45d3-a986-adf2aee1e232&pd_rd_r=f5f84cf8-25c9-4199-949a-6afa38270760&pd_rd_w=GiffD&pd_rd_wg=8MAlw&pf_rd_p=a89ed4ff-2e3d-45d3-a986-adf2aee1e232&pf_rd_r=X39PTP45FHA7TFSTEYCP&ref=Oct_d_otopr_S'

response = Nokogiri::HTML(URI.open(url_string).read)


products_list = []

products_list.append("\n\n")
products_list.append("============== PRODUCTS ==============\n\n")

response.css('div.s-result-item').each do |element|
    name = element.css("h2.a-size-mini").text.strip
    price = element.css("span.a-offscreen").text.strip

    if !name.to_s.strip.empty? && !price.to_s.strip.empty?
        products_list.append("Title: " + name.to_s + "\n")
        products_list.append("Price: " + price.to_s + "\n")

        products_list.append("\n")
    end
end

puts products_list
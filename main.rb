#!/usr/bin/env ruby
# 
# require 'nokogiri'
# require 'open-uri'
# 
url_string = 'https://www.amazon.pl/s?rh=n%3A20930508031%2Cp_72%3A4-&content-id=amzn1.sym.a89ed4ff-2e3d-45d3-a986-adf2aee1e232&pd_rd_r=f5f84cf8-25c9-4199-949a-6afa38270760&pd_rd_w=GiffD&pd_rd_wg=8MAlw&pf_rd_p=a89ed4ff-2e3d-45d3-a986-adf2aee1e232&pf_rd_r=X39PTP45FHA7TFSTEYCP&ref=Oct_d_otopr_S'
# 
# doc = Nokogiri::HTML(URI.open(url_string))
# 
# doc.css('span').each do |link|
#     puts link.content
# end
# 
# 
# # puts "Hello, world"

require 'nokogiri'
require 'open-uri'
require 'rubygems'

product = ARGV[0]

url = "https://www.amazon.com/s?k= %s " % [product]
headers = {"User-Agent" => 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Silk/44.1.54 like Chrome/44.0.2403.63 Safari/537.36',
'Accept-Language' => 'en-US, en;q=0.5'}
page = URI.open(url_string, headers)
response = Nokogiri::HTML(page.read)

puts "Program started\n"

products_info = []
time = Time.now
file_name = "crawler-" + product + "-" + time.strftime("%m-%d-%Y-%H-%M-%S") + ".txt"

info = response.css('div.s-result-item').each do |element|  
    name = element.css("h2.a-size-mini.a-spacing-none.a-color-base.s-line-clamp-2 span.a-size-medium.a-color-base.a-text-normal").text.strip 
    price = element.css("span.a-price span.a-offscreen").text.strip.split("$", 0)[1]
    link = element.css("a.a-size-base.a-link-normal.s-link-style.a-text-normal").map { |link| link['href'] }

    if !name.to_s.strip.empty? && !price.to_s.strip.empty? && !link.to_s.strip.empty?
        products_info.append("Description: " + name.to_s + "\n")
        products_info.append("Price: " + price.to_s + "$\n")
#         url2 = "https://www.amazon.com%s " % link
#         File.open(file_name, "a") { |f| f.write url2 + "\n" }
#         page2=URI.open(url2, headers)
#         resp = Nokogiri::HTML(page2.read)
# 
#         products_info.append(resp.at_css('[id="mir-layout-DELIVERY_BLOCK-slot-PRIMARY_DELIVERY_MESSAGE_LARGE"]').text.strip.to_s + "\n")
        products_info.append("\n")
    end
end

puts products_info
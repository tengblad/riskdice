#!/usr/bin/ruby
require 'RMagick'

print "Content-type: text/html\n\n"

img_path = "/home/sites/tengblad.net/img/"
dice_img_path = "/home/tengblad/programming/ruby/diceroller/"
time = Time.now
time1 = time.strftime("%Y-%m-%d_%H%M%S")
#p time1

filename = "dice_appended_#{time1}.png"
url = "http://www.tengblad.net/img/#{filename}"
def dice_roll(type)
	roll = 1 + rand(type)
end

dice = [4, 6, 12, 6, 4, 12]

dice_list = Magick::ImageList.new

dice.each do |x|
	puts "Dan rolls a D#{x}</p>"
	result = dice_roll(x)

	dice_img = Magick::Image.read("#{dice_img_path}/d#{x}_#{result}.png")
	dice_list.push(dice_img[0])

	puts "He gets a #{result}</p>"
	puts "\n"
end

#p dice_list
dice_append = dice_list.append(false)
dice_append.write("#{img_path}/dice_appended_#{time1}.png")

puts "<img src=\"#{url}\">"
puts "</p>"
puts "Image saved <a href=\"#{url}\">here</a>"

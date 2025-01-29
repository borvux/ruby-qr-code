require "rqrcode"

# qrcode = RQRCode::QRCode.new("wikipedia qr code")
# WIFI:T:WPA;S:My wifi network;P:supersecretpassword;;
# SMSTO:9876543210:Hi Alice! It's
# png = qrcode.as_png({ :size => 500 })
# IO.binwrite("sometext.png", png.to_s)

puts "What kind of QR code would you like to generate?"
puts
puts "1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message"
puts
puts "Press 4 to exit"
puts

user_input = gets.chomp
puts

case user_input
when "1"
  puts "What is the URL you would like to encode?"
  puts

  url = gets.chomp
  puts

  encode = url
when "2"
  puts "What is the name of the wifi network?"
  puts

  wifi_name = gets.chomp
  puts

  puts "What is the password?"
  puts

  password = gets.chomp
  puts

  encode = "WIFI:T:WPA;S:#{wifi_name};P:#{password};;"
when "3"
  puts "What is the phone number you want the code to send a text message to?"
  puts

  phone_number = gets.chomp
  puts

  puts "What do you want to populate the message with?"
  puts

  content = gets.chomp
  puts

  encode = "SMSTO:#{phone_number}:#{content}"
else
  puts "Goodbye!"
  exit
end

puts "What would you like to call the PNG?"
puts

filename = gets.chomp
puts

qrcode = RQRCode::QRCode.new("#{encode}")
png = qrcode.as_png({ :size => 500 })
IO.binwrite("#{filename}.png", png.to_s)

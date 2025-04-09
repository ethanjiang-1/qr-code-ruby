require "rqrcode"

puts "What kind of QR code would you like to generate?"

puts "\n 1. Open a URL \n 2. Join a wifi network \n 3. Send a text message \n \nPress 4 to exit\n "
user_input = gets.chomp.to_i

def make_qrcode(qr_input, filename)
  qrcode = RQRCode::QRCode.new("#{qr_input}")
  png = qrcode.as_png({ :size => 500})
  IO.binwrite("#{filename}.png", png.to_s)
end

if user_input < 1 || user_input >= 5
  puts "Didn't recognize that selection. Please try again."
elsif user_input == 1
  puts "\nWhat is the URL you would like to go to?\n "
  url = gets.chomp.to_s
  puts "\nWhat would you like to call the PNG?\n "
  filename = gets.chomp.to_s
  make_qrcode(url, filename)
elsif user_input == 2
  puts "\nWhat is the wifi network name?\n "
  wifi_network = gets.chomp.to_s
  puts "\nWhat is the password?\n "
  pw = gets.chomp.to_s
  puts "\nWhat would you like to call the PNG?\n "
  filename = gets.chomp.to_s
  input_info = "WIFI:T:WPA;S:#{wifi_network};P:#{pw};;"
  make_qrcode(input_info, filename)
elsif user_input == 3
  puts "\nWhat is the phone number?\n "
  phone_num = gets.chomp.to_s
  puts "\nWhat is your message?\n "
  message = gets.chomp.to_s
  input_info = "SMSTO:#{phone_num}:#{message}"
  puts "\nWhat would you like to call the PNG?\n "
  filename = gets.chomp.to_s
  make_qrcode(input_info, filename)
end

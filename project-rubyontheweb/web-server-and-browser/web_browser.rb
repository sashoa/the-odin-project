require 'socket'
require 'json'

host = "localhost"
port = 2000
path  = "/index.html"

get_request = "GET #{path} HTTP/1.0\r\nHost: #{host}\nCache-Control: no-cache\nAccept: text/html\r\n\r\n"

puts "Choose 'g' for GET or 'p' for POST method"
choice = gets.chomp

if choice == 'g'
  request = get_request
elsif choice == 'p'
  print "\nInput your name: "
  name = gets.chomp
  print "\nInput your email: "
  email = gets.chomp
  store = {viking: {name: name, email: email }, ninja: {name: "sashe", email: "sash239@gmail"}}
  request = "POST #{path} HTTP/1.1\r\nFrom: #{email}\nContent-Type: text/html\nContent-Length: #{store.to_json.length}\r\n\r\n#{store.to_json}"
end

socket = TCPSocket.open(host, port)
socket.write(request)
socket.close_write
response = socket.read

headers, body = response.split("\r\n\r\n", 2)
print body

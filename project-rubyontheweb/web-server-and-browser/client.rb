require 'socket'

hostname = "localhost"
port = 2000
path = "/index.html"

s = TCPSocket.open(hostname, port)
s.puts("GET #{path} HTTP/1.0\r\n\r\n")

while line = s.gets
  puts line.chop
end
s.close

require 'socket'

server = TCPServer.open(2000)
loop do
  client = server.accept
  a = client.gets
  client.puts a
  client.puts(Time.now.ctime)
  client.puts("Closing the connection. Bye!")
  client.close
end

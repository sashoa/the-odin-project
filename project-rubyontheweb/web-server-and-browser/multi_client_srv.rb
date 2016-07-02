require 'socket'
require 'net/http'
require 'json'
require 'erb'

def parse(request)
  a = Hash.new
  if request.match(/^GET/)
    b = request.match(/(\w+) \/(.*) (.*)\r\n(.*: .*)\n(.*: .*)\n(.*: .*)\s+/)
    a[:verb] = b[1]
    a[:path] = b[2]
    a
  else request.match(/^POST/)
    b = request.match(/^(.*) \/(.*) .*\r\n(.*)\n(.*)\n(.*)\r\n\r\n(.*)$/)
    a[:path] = b[2] 
    a[:verb] = b[1]
    a[:content_length] = b[5].split(" ")[1]
    a[:params] = JSON.parse(b[6])
    a
  end
end

server = TCPServer.open(2000)
loop do
  Thread.start(server.accept) do |client|
    response = nil
    parsed_request = parse(client.read)
    if parsed_request[:verb] == "GET"
      if File.exists?(parsed_request[:path])
        file_content = File.open(parsed_request[:path]).read
        response = "HTTP/1.1 200 OK\nDate: #{Time.now.ctime}\nContent-type: text/html\nContent-length: #{file_content.length}\r\n\r\n#{file_content}"
      else
        response = "HTTP/1.1 404 Not Found"
      end

    elsif parsed_request[:verb] == "POST"
      template = File.open("thanks.erb.html").read
      z = ERB.new(template)
      response = "HTTP/1.1 200 OK\n#{Time.new.ctime}\nContent-Length: #{template.size}\r\n\r\n#{z.result(binding)}"
    end
    client.puts response
    # client.puts(Time.now.ctime)
    # client.puts(File.open(parsed_request[path]).read)
    client.close
  end
end

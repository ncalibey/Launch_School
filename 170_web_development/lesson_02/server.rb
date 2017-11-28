# server.rb
require "socket"
server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/plain\r\n\r\n"

  request_line = client.gets
  puts request_line

  client.puts request_line
  client.close
end

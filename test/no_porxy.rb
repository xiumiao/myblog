require "net/http"
require "uri"

uri = URI.parse("http://rdc-jianghe.focuschina.com/")

# Shortcut
response = Net::HTTP.get_response(uri)

puts response.body

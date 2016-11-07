require "foursquare2"
require "geocoder"
require "json"

@barcelona = '28.613939, 77.209021'

client = Foursquare2::Client.new(:client_id => 'FHYVHFOT031UFFEIEWLDZ5AVNG2H354GGZN2AO4HK3GNUF1X', :client_secret => 'O1B2RITHVMKSBDBCFWEPXT14GXJJEW3XVUL5BJ5RVNS0MLGF', :api_version => '20120609')

search = client.search_venues(:ll => @barcelona, :query => 'vinitus').to_json

search = JSON.parse(search)

vinitus =  client.venue_tips("54859d75498ec850acd351e3", :query => '').to_json

vinitus = JSON.parse(vinitus).to_hash

# vinitus['items'].each do |place|
#   if place['text'].downcase.include? 'pudding'
#     puts place['text']
#   end
# end

trending = client.trending_venues(@barcelona, {:limit => 100, :radius => 2000}).to_json

trending = JSON.parse(trending).to_hash

puts trending

trending['venues'].each do |place|
  puts place['name']
end

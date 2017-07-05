require 'HTTParty'
require 'rubygems'
require 'savon'
require 'pp'

class XigniteAdapter
  include HTTParty

  url = "http://factsetfundamentals.xignite.com/xFactSetFundamentals.asmx?WSDL"

  soap_header = {
       "Header" => {
            "@xmlns" => "http://www.xignite.com/services/",
            "Username" => "7B51516674F74D91A3164A19089933A9"
            }
       }

  client = Savon.client(wsdl: url, :soap_header => soap_header, convert_request_keys_to: :none, env_namespace: 'soap')

  response = client.call(:list_companies, message: {
       "@xmlns" => "http://www.xignite.com/services/",
  	MarketIdentificationCode: 'XNYS',
  	StartSymbol: 'A',
  	EndSymbol: 'B'
  })

  pp response.to_hash

end

# url = "http://factsetfundamentals.xignite.com/xFactSetFundamentals.asmx?WSDL"
#
# soap_header = {
#      "Header" => {
#           "@xmlns" => "http://www.xignite.com/services/",
#           "Username" => "7B51516674F74D91A3164A19089933A9"
#           }
#      }
#
# client = Savon.client(wsdl: url, :soap_header => soap_header, convert_request_keys_to: :none, env_namespace: 'soap')
#
# response = client.call(:list_companies, message: {
#      "@xmlns" => "http://www.xignite.com/services/",
# 	MarketIdentificationCode: 'XNYS',
# 	StartSymbol: 'A',
# 	EndSymbol: 'B'
# })
#
# pp response.to_hash


# *******************

class StackExchange
  include HTTParty
  base_uri 'api.stackexchange.com'

  def initialize(service, page)
    @options = { query: { site: service, page: page } }
  end

  def questions
    self.class.get("/2.2/questions", @options)
  end

  def users
    self.class.get("/2.2/users", @options)
  end
end

stack_exchange = StackExchange.new("stackoverflow", 1)
puts stack_exchange.questions
puts stack_exchange.users

require 'pp'
require 'httparty'
require 'json'
require 'savon'

class XigniteAdapter
  include HTTParty

  def self.marketcap2
  url = "https://factsetfundamentals.xignite.com/xFactSetFundamentals.json/GetFundamentals?IdentifierType=Symbol&Identifiers=TSLA&FundamentalTypes=MarketCapitalization&AsOfDate=7/4/2017&ReportType=TTM&ExcludeRestated=False&UpdatedSince=&token=EF5A28772B2A4166BB095C29A576E670"
  response = HTTParty.get(url)

  end

  def self.marketcap(symbol)
    url = "http://factsetfundamentals.xignite.com/xFactSetFundamentals.asmx?WSDL"

    soap_header = {
         "Header" => {
              "@xmlns" => "http://www.xignite.com/services/",
              "Username" => "EF5A28772B2A4166BB095C29A576E670"
              }
         }

    client = Savon.client(wsdl: url, :soap_header => soap_header, convert_request_keys_to: :none, env_namespace: 'soap')

    response = client.call(:get_latest_fundamentals, message: {
         "@xmlns" => "http://www.xignite.com/services/",
    	Identifiers: symbol,
    	IdentifierType: 'Symbol',
    	FundamentalTypes: 'MarketCapitalization',
    	UpdatedSince: ''
    })

  puts response.to_hash


  end



end





# ----------------------------------------------------


# def self.fundamentals(symbol)
#   url = "http://factsetfundamentals.xignite.com/xFactSetFundamentals.asmx?WSDL"
#
#   soap_header = {
#        "Header" => {
#             "@xmlns" => "http://www.xignite.com/services/",
#             "Username" => "EF5A28772B2A4166BB095C29A576E670"
#             }
#        }
#
#   client = Savon.client(wsdl: url, :soap_header => soap_header, convert_request_keys_to: :none, env_namespace: 'soap')
#
#   response = client.call(:get_latest_fundamentals, message: {
#        "@xmlns" => "http://www.xignite.com/services/",
#   	Identifiers: symbol,
#   	IdentifierType: 'Symbol',
#   	FundamentalTypes: 'MarketCapitalization',
#   	UpdatedSince: ''
#   })
#
#   @response = response.parsed_response
#   pp response.parsed_response
#   p '************'
#   p @response[fundamantals_sets]
# end




# -----------------------------------------------------------------

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

# class StackExchange
#   include HTTParty
#   base_uri 'api.stackexchange.com'
#
#   def initialize(service, page)
#     @options = { query: { site: service, page: page } }
#   end
#
#   def questions
#     self.class.get("/2.2/questions", @options)
#   end
#
#   def users
#     self.class.get("/2.2/users", @options)
#   end
# end
#
# stack_exchange = StackExchange.new("stackoverflow", 1)
# puts stack_exchange.questions
# puts stack_exchange.users

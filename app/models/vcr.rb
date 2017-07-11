# require 'rubygems'
# require 'test/unit'
# require 'vcr'
#
# VCR.configure do |config|
#   config.cassette_library_dir = "fixtures/vcr_cassettes"
#   config.hook_into :webmock
# end
#
# class VCRTest < Test::Unit::TestCase
#   def MSFT_1
#     VCR.use_cassette("synopsis") do
#       response = AlphaAdapter.dynamic_search('MSFT', 1)
#       assert_match /Example domains/, response.body
#     end
#   end
#   def MSFT_5
#     VCR.use_cassette("synopsis") do
#       response = AlphaAdapter.dynamic_search('MSFT', 5)
#       assert_match /Example domains/, response.body
#     end
#   end
#   def MSFT_1
#     VCR.use_cassette("synopsis") do
#       response = AlphaAdapter.dynamic_search('MSFT', 1)
#       assert_match /Example domains/, response.body
#     end
#   end
#   def MSFT_1
#     VCR.use_cassette("synopsis") do
#       response = AlphaAdapter.dynamic_search('MSFT', 1)
#       assert_match /Example domains/, response.body
#     end
#   end
# end

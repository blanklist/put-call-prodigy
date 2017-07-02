require 'quandl'

class QuandlAdapter
  def initialize
    Quandl::ApiConfig.api_key = ''
    Quandl::ApiConfig.api_version = '2017-07-01'
  end



  def self.search
    require 'quandl'
    yo = Quandl::Dataset.get('WIKI/AAPL')
    p yo
  end
end


#NOTES-----------------------
# ENV['ALPHA_API']
# up_function = function.split.join('_').upcase

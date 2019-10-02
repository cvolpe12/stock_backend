require 'rest-client'
require 'dotenv/load'

class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  def self.get_stock_info(stock)
    # print(ENV["API_KEY"])
    url = "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=#{stock}&apikey=#{ENV["API_KEY"]}"
    data = RestClient.get(url, {accept: :json})
    return JSON.parse(data)
  end

end

require 'csv'
require 'open-uri'
require 'json'

class Api
  def searcher(tag)
    api_url = "https://api.bol.com/catalog/v4/search/?q=#{tag_cleaner(tag)}&offset=0&limit=2&dataoutput=products,categories&apikey=#{ENV["BOL"]}&format=json"
    open(api_url) do |stream|
      response = JSON.parse(stream.read)
      if response["products"] != []
        result = response["products"].first["images"].last["url"]
      else
        result = 'http://media1.giphy.com/media/F9AU77Krzw8ta/200.gif'
      end
    end
  end

  private

  def tag_cleaner(tag)
    tag.split(" ").join('+')
  end
end

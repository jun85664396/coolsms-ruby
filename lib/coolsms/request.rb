class Request

  #URI
  attr_accessor :uri

  def initialize
    self.uri = URI("https://api.coolsms.co.kr")
  end

  def post(key, fields = {})
    res = Net::HTTP.post_form(self.uri+"/1.5/#{key}", fields)
  end

  def get(key, fields = {})
    uri = URI(self.uri+"/1.5/#{key}")
    uri.query = URI.encode_www_form(fields)
    res = Net::HTTP.get_response(uri)
  end
end

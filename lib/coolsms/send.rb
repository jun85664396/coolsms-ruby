require_relative "auth"
class Send
  #URI
  attr_accessor :uri

  #SMS Type default : SMS
  attr_accessor :type

  #Salt
  attr_accessor :salt

  #Charset
  attr_accessor :charset

  #Datetime Format YYYYMMDDHHMISS
  attr_accessor :datetime

  #Delay
  attr_accessor :delay

  #Refname
  attr_accessor :refname

  #Country Korea => 82, Japan => 81, China => 86, USA => 1
  attr_accessor :country

  #Subject
  attr_accessor :subject

  #Srk
  attr_accessor :srk

  #Mode
  attr_accessor :mode

  #Extension
  attr_accessor :extension

  #Force_sms
  attr_accessor :force_sms

  protected 

  def initialize(options = {})
    self.uri = URI("https://api.coolsms.co.kr/")
    options.each do |key, value|
      self.public_send( "#{key}=", value ) if self.class.instance_methods.include? key
    end
  end

  public

  def send (from, to, text)
    fields = self.fields( :type, :charset, :datetime, :delay )
    fields = fields.merge(from: from, to: to, text: text, type: self.type )
    res = Net::HTTP.post_form(self.uri+"/1/send", fields)
    if res.code == "200"
      body = JSON.parse(res.body)
      { ret: body['result_code'] == "00", message: body['result_message'], code: res.code }
    else
      { ret: false, code: res.code }
    end
  end 

  def fields(*keys)
    auth = Auth.new
    field = { api_key: auth.api_key, signature: auth.signature, timestamp: auth.timestamp, salt: auth.salt}
    keys.each do |key|
      if self.class.instance_methods.include? key
        field[key] = self.public_send(key)
      end
    end
    return field
  end

end

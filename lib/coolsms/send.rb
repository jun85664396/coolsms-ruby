class Send

  #SMS Type default : SMS
  attr_accessor :type

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
    self.set_fields(options)
  end

  def fields(*keys)
    field = Auth.new.auth
    keys.each do |key|
      if self.class.instance_methods.include? key
        field[key] = self.public_send(key)
      end
    end
    return field
  end

  public

  def send(from, to, text)
    fields = self.fields( :type, :charset, :datetime, :delay, :refname, :country, :subject, :srk, :mode, :extension, :force_sms )
    fields = fields.merge(from: from, to: to, text: text, type: self.type )

    res = Request.new.post( "send", fields )
    if res.code == "200"
      body = JSON.parse(res.body)
      { ret: body['result_code'] == "00", message: body['result_message'], code: res.code }
    else
      { ret: false, code: res.code }
    end
  end 

  def set_fields(options)
    options.each do |key, value|
      self.public_send( "#{key}=", value ) if self.class.instance_methods.include? key
    end
  end

end

class Send < Applications

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

  def initialize(options = {})
    self.set_fields(options)
  end

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

end

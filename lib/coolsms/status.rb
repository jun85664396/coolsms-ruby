class Status < Applications

  attr_accessor :count

  #minute(default), hour, day
  attr_accessor :unit

  #Datetime Format YYYYMMDDHHMISS
  attr_accessor :date

  attr_accessor :channel

  def initialize(options = {})
    self.set_fields(options)
  end

  def status
    fields = self.fields( :count, :unit, :date, :channel )
    res = Request.new.get( "status", fields )

    if res.code == "200"
      body = JSON.parse( res.body )
      { ret: true, message: body, code: res.code }
    else
      { ret: false, code: res.code }
    end
  end
end

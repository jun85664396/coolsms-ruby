class Sent < Applications

  attr_accessor :count

  attr_accessor :page

  attr_accessor :rcpt

  # Date Format YYYY-MM-DD HH:MI:SS
  attr_accessor :start

  # DateFormat YYYY-MM-DD HH:MI:SS
  attr_accessor :end

  attr_accessor :status

  attr_accessor :resultcode

  attr_accessor :notin_resultcode

  attr_accessor :mid

  attr_accessor :gid

  def initialize(options={})
    self.set_fields( options )
  end

  def sent
    fields = self.fields( :count, :page, :rcpt, :start, :end, :status, :resultcode, :notin_resultcode, :mid, :gid )
    res = Request.new.get( "sent", fields )

    if res.code == "200"
      body = JSON.parse( res.body )
      { ret: true, message: body, code: res.code }
    else
      { ret: false, code: res.code }
    end
  end

end

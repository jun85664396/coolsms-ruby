class Sent < Applications

  # Message count
  # defualt: 20
  attr_accessor :count

  attr_accessor :page

  # Search for to number
  attr_accessor :rcpt

  # Date Format YYYY-MM-DD HH:MI:SS
  attr_accessor :start

  # DateFormat YYYY-MM-DD HH:MI:SS
  attr_accessor :end

  # Message status
  attr_accessor :status

  # Sending result code
  attr_accessor :resultcode

  attr_accessor :notin_resultcode

  # Message ID
  attr_accessor :mid

  # Group ID
  attr_accessor :gid

  def initialize(options={})
    self.set_fields( options )
  end

  def sent
    fields = self.fields(
      :count, :page, :rcpt, :start, :end,
      :status, :resultcode, :notin_resultcode, :mid, :gid
    )
    res = Request.new.get( "sent", fields )

    if res.code == "200"
      body = JSON.parse( res.body )
      { ret: true, message: body, code: res.code }
    else
      { ret: false, code: res.code }
    end
  end
end

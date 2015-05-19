class Cancel < Applications

  # Message Id
  attr_accessor :mid

  # Group Id
  attr_accessor :gid

  def initialize(options = {})
    self.set_fields( options )
  end

  def cancel
    fields = self.fields( :mid, :gid )
    res = Request.new.post( "cancel", fields )

    if res.code == "200"
      { ret: true }
    else
      { ret: res.code == "200", message: JSON.parse(res.body) }
    end
  end

end

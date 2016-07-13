class Balance

  def balance
    fields = Auth.new.auth
    res = Request.new.get( "balance", fields )

    if res.code == "200"
      body = JSON.parse( res.body )
      { ret: true, message: body, code: res.code }
    else
      { ret: false, code: res.code }
    end
  end
end

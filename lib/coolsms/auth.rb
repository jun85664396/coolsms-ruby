class Auth

  #Time Default : now
  attr_accessor :timestamp

  #Salt
  attr_accessor :salt

  #API KEY
  attr_accessor :api_key

  #API SECRET KEY
  attr_accessor :api_secret

  def initialize
    self.api_key ||= ENV['COOLSMS_KEY']
    self.api_secret ||= ENV['COOLSMS_SECRET_KEY']
  end

  def signature
    self.timestamp = Time.now.to_i
    self.salt = SecureRandom.hex
    hmac_data = self.timestamp.to_s + self.salt.to_s
    OpenSSL::HMAC.hexdigest( "md5", self.api_secret, hmac_data )
  end

  def auth
    { api_key: self.api_key, signature: self.signature, timestamp: self.timestamp, salt: self.salt }
  end
end

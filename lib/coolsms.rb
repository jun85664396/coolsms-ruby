require "coolsms/version"
require 'securerandom'
require 'net/http'
require 'json'

module Coolsms
  class SMS

    protected
    #URI
    attr_accessor :uri

    #API KEY
    attr_accessor :api_key

    #API SECRET KEY
    attr_accessor :api_secret

    #SMS Type default : SMS
    attr_accessor :type

    #Salt
    attr_accessor :salt

    #Time Default : now
    attr_accessor :timestamp

    #Salt
    attr_accessor :salt
    
    #Charset
    attr_accessor :charset

    #Datetime Format YYYYMMDDHHMISS
    attr_accessor :datetime

    #Delay
    attr_accessor :delay

    def initialize(api_key, api_secret, options = {})
      self.uri = URI("https://api.coolsms.co.kr/")
      self.api_key ||= api_key
      self.api_secret ||= api_secret
      self.type ||= options[:type]
      self.charset ||= options[:charset]
      self.datetime ||= options[:datetime]
      self.delay ||= options[:delay]
    end

    def signature
      self.timestamp = Time.now.to_i
      self.salt = SecureRandom.hex
      hmac_data = self.timestamp.to_s + self.salt.to_s
      OpenSSL::HMAC.hexdigest("md5", self.api_secret, hmac_data)
    end

    public
    def send(from, to, text)
      signature = self.signature
      fields = {api_key: self.api_key, timestamp: self.timestamp, salt: self.salt, signature: signature, from: from, to: to, text: text, type: self.type, charset: self.charset, datetime: self.datetime, delay: self.delay}
      res = Net::HTTP.post_form(self.uri+"/1/send", fields)
      if res.code == "200"
        body = JSON.parse(res.body)
        return {ret: true, message: body['result_message'], code: res.code} if body['result_code'] == "00"
        return {ret: false, message: body['result_message'], code: res.code}
      else
        return {ret: false, code: res.code}
      end
    end 

  end
end

require "coolsms/version"
require 'securerandom'
require 'net/http'
require 'json'
require_relative "coolsms/auth"
require_relative "coolsms/request"
require_relative 'coolsms/send'
require_relative 'coolsms/balance'

module Coolsms
  class SMS

    Send = Class.new(Send)
    Balance = Class.new(Balance)
  
  end
end

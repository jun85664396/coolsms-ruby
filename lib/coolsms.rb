require "coolsms/version"
require 'securerandom'
require 'net/http'
require 'json'
require_relative 'coolsms/applications'
require_relative "coolsms/auth"
require_relative "coolsms/request"
require_relative 'coolsms/send'
require_relative 'coolsms/balance'
require_relative 'coolsms/status'

module Coolsms
  class SMS

    Send = Class.new(Send)
    Balance = Class.new(Balance)
    Status = Class.new(Status)
  
  end
end

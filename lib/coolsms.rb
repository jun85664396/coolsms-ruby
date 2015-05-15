require "coolsms/version"
require 'securerandom'
require 'net/http'
require 'json'
require_relative "coolsms/auth"
require_relative "coolsms/request"
require_relative 'coolsms/send'

module Coolsms
  class SMS

    Send = Class.new(Send)
  
  end
end

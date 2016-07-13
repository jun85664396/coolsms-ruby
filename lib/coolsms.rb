# @name                Coolsms Rest API Helper
# @author              JunSangPil
# @version             0.1.2
# @url                 http://github.com/jun85664396/coolsms
# @license             MIT License

require 'securerandom'
require 'net/http'
require 'json'
require_relative 'coolsms/version'
require_relative 'coolsms/applications'
require_relative 'coolsms/auth'
require_relative 'coolsms/request'
require_relative 'coolsms/send'
require_relative 'coolsms/balance'
require_relative 'coolsms/status'
require_relative 'coolsms/sent'
require_relative 'coolsms/cancel'

module Coolsms
  class SMS
    Send = Class.new(Send)
    Balance = Class.new(Balance)
    Status = Class.new(Status)
    Sent = Class.new(Sent)
    Cancel = Class.new(Cancel)
  end
end

require_relative 'test_helper'

describe "Coolsms" do
  before do
    ENV['COOLSMS_KEY'] = "NCS52A57F48C3D32"
    ENV['COOLSMS_SECRET_KEY'] = "5AC44E03CE8E7212D9D1AD9091FA9966"
  end

  it "Send" do
    send = Coolsms::SMS::Send.new(mode: "test")
    res = send.send("01012345678", "01000000000", "Test Message")
    p res

    assert_equal res[:code], "200"
  end

  it "Balance" do
    balance = Coolsms::SMS::Balance.new
    res = balance.balance
    p res

    assert_equal res[:code], "200" 
  end

  it "Status" do
    status = Coolsms::SMS::Status.new
    res = status.status
    p res

    assert_equal res[:code], "200" 
  end

  it "Sent" do
    sent = Coolsms::SMS::Sent.new
    res = sent.sent
    p res

    assert_equal res[:code], "200" 
  end

end

class Send < Applications

  # Message Type : SMS(default), LMS, MMS, ATA
  # If not +82, force SMS
  attr_accessor :type

  # Image
  # JPEG, PNG, GIF < 300KB, 2048x2048 px
  attr_accessor :image

  # Image encoding
  # binary(default), base64
  attr_accessor :image_encoding

  # Reference name
  attr_accessor :refname

  # Country
  # Korea : +82 (default)
  attr_accessor :country

  # Schedule datetime.
  # Format: YYYYMMDDHHMISS
  attr_accessor :datetime

  # MMS, LMS subject
  attr_accessor :subject

  # Charset encoding
  # default: utf8
  attr_accessor :charset

  # Srk
  attr_accessor :srk

  # Mode
  # if 'test'
  #   from_num : '010000000'
  #   datetime is ignore
  #   return_value : 60
  #   recharge
  attr_accessor :mode

  # Extension
  # JSON data
  attr_accessor :extension

  # Delay
  # value : 0 ~ 20
  attr_accessor :delay

  # Force SMS
  # true or false
  attr_accessor :force_sms

  # Client OS and platform
  attr_accessor :os_platform

  # Development language
  attr_accessor :dev_lang

  # SDK version
  attr_accessor :sdk_version

  # Application version
  attr_accessor :app_version

  # AlarmTalk sender Key
  attr_accessor :sender_key

  # AlarmTalk template code
  attr_accessor :template_code

  def initialize(options = {})
    self.set_fields(options)
  end

  def send(from, to, text)
    fields = self.fields(
      :type, :image, :image_encoding, :refname, :country,
      :datetime, :subject, :charset, :srk, :mode,
      :extension, :delay, :force_sms, :os_platform, :dev_lang,
      :sdk_version, :app_version, :sender_key, :template_code
    )

    fields = fields.merge( from: from, to: to, text: text, type: self.type )

    res = Request.new.post( "send", fields )

    if res.code == "200"
      body = JSON.parse(res.body)
      {
        ret: body['result_code'] == "00",
        message: body['result_message'],
        code: res.code,
        gid: body['group_id']
      }
    else
      {
        ret: false,
        code: res.code
      }
    end
  end
end

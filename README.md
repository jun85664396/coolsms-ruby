# Coolsms

coolsms Rest API helper

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'coolsms'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install coolsms
```

Test

```
$ ruby test/coolsms_test.rb -v
```

## Configuration

- `ENV['COOLSMS_KEY']` and `ENV['COOLSMS_SECRET_KEY']`

## Usage 

#### Send < Applications

```ruby
COOLSMS_SEND = Coolsms::SMS::Send.new( { options } )
COOLSMS_SEND.send( from, to, text)
COOLSMS_SEND.set_field( { options} )
```

* Options
  - type
  - image
  - image_encoding
  - refname
  - country
  - datetime
  - subject
  - charset
  - srk
  - mode
  - extension
  - delay
  - force_sms
  - os_platform
  - dev_lang
  - sdk_version
  - app_version
  - sender_key
  - template_code

* Methods
  - send
  - set_field
    
#### Balance

```ruby
COOLSMS_BALANCE = Coolsms::SMS::Balance.new
COOLSMS_BALANCE.balance
```

* Methods
  - balance

#### Status < Applications

```ruby
COOLSMS_STATUS = Coolsms::SMS::Status.new( options )
COOLSMS_STATUS.status
```

* Options
  - count
  - unit
  - date
  - channel
    
* Methods
  - status

#### Sent < Applications

```ruby
COOLSMS_SENT = Coolsms::SMS::Sent.new( options )
COOLSMS_SENT.sent
```

* Options
  - count
  - page
  - rcpt
  - start
  - end
  - status
  - resultcode
  - notin_resultcode
  - mid
  - gid
    
* Methods
  - sent

#### Cancel < Applications

```ruby
COOLSMS_CANCEL = Coolsms::SMS::Cancel.new( options )
COOLSMS_CANCEL.cancel
```

* Options
  - mid
  - gid
    
* Methods
  - cancel
    
#### Applications

* Methods
  - set_fields
  - fields
    
#### TODO

- [x] Send
- [x] Sent
- [x] Cancel
- [x] Balance
- [x] Status

## Coolsms Rest API Document

* [Coolsms REST API](http://www.coolsms.co.kr/REST_API)
* Support API version : 1.5

## Contributing

1. Fork it ( https://github.com/[my-github-username]/coolsms/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Source

https://github.com/jun85664396/coolsms

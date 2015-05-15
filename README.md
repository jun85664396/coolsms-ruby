# Coolsms

coolsms Rest API helper

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'coolsms'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coolsms

## Configuration

- `ENV['COOLSMS_KEY']` and `ENV['COOLSMS_SECRET_KEY']`

## Usage 

- ####Send

        COOLSMS_SEND = Coolsms::SMS::Send.new( { options } )
        COOLSMS_SEND.send( from, to, text)
    Options
    - type
    - charset
    - datetime
    - delay
    - refname
    - country
    - subject
    - srk
    - mode
    - extension
    - force_sms

    Methods
    - send
    - set_field
    
        
## Coolsms Rest API Document

http://www.coolsms.co.kr/REST_API_Global

## Contributing

1. Fork it ( https://github.com/[my-github-username]/coolsms/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

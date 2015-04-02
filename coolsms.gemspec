# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coolsms/version'

Gem::Specification.new do |spec|
  spec.name          = "coolsms"
  spec.version       = Coolsms::VERSION
  spec.authors       = ["JunSangPil"]
  spec.email         = ["jun85664396@gmail.com"]
  spec.summary       = %q{coolsms Rest API helper}
  spec.description   = %q{The coolsms ruby module not supporting. so I have made ruby module.}
  spec.homepage      = "http://github.com/jun85664396"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

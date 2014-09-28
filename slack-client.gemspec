# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slack/version'

Gem::Specification.new do |spec|
  spec.name          = 'slack-client'
  spec.version       = Slack::VERSION
  spec.authors       = ['Jesse Farmer']
  spec.email         = ['jesse@codeunion.io']
  spec.summary       = 'Ruby Slack API gem'
  spec.description   = 'A Ruby client for the Slack API.'
  spec.homepage      = 'http://github.com/codeunion/slack-client'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'faraday',     '~> 0.9'
  spec.add_runtime_dependency 'addressable', '~> 2.3'
  spec.add_runtime_dependency 'thor',        '~> 0.19'
  spec.add_runtime_dependency 'multi_json',  '~> 1.10'
  spec.add_runtime_dependency 'dotenv',      '~> 0.11'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rubocop', '~> 0.25'
  spec.add_development_dependency 'rake',    '~> 10.0'
end

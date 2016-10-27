# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/beam/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-beam'
  spec.version       = OmniAuth::Beam::VERSION
  spec.authors       = ['Christopher Nicholson-Sauls "charmquark"']
  spec.email         = ['ibisbasenji@gmail.com']
  spec.summary       = 'Beam.pro OAuth2 Strategy for OmniAuth'
  spec.homepage      = 'https://github.com/csauls/omniauth-beam'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake', '~> 0'
end

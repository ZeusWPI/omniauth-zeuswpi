# frozen_string_literal: true

require File.expand_path(
  File.join('..', 'lib', 'omniauth', 'zeuswpi', 'version'),
  __FILE__
)

Gem::Specification.new do |gem|
  gem.name          = 'omniauth-zeuswpi'
  gem.version       = OmniAuth::ZeusWPI::VERSION
  gem.license       = 'MIT'
  gem.summary       = %(A Zeus WPI strategy for OmniAuth 1.x)
  gem.description   = %(A Zeus WPI strategy for OmniAuth 1.x. This allows you to login to Zauth with your ruby app.)
  gem.authors       = ['Tom Naessens', 'Zeus WPI']
  gem.email         = ['']
  gem.homepage      = 'https://github.com/ZeusWPI/omniauth-zeuswpi'

  gem.files         = `git ls-files`.split("\n")
  gem.require_paths = ['lib']

  gem.required_ruby_version = '>= 2.2'

  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.7.1'
end

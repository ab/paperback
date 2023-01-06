# frozen_string_literal: true

require_relative 'lib/paperback/version'

Gem::Specification.new do |spec|
  spec.name          = 'paperback'
  spec.version       = Paperback::VERSION
  spec.authors       = ['Andy Brody']
  spec.email         = ['git@abrody.com']
  spec.summary       = 'Create paper backups of sensitive data'
  spec.description   = <<-EOM
    Paperback is a library for creating printable paper backups of small
    amounts of sensitive data like cryptographic keys.
  EOM
  spec.homepage      = 'https://github.com/ab/paperback'
  spec.license       = 'GPL-3'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.50'
  spec.add_development_dependency 'sorbet', '~> 0.4'
  spec.add_development_dependency 'yard'

  spec.add_dependency('prawn', '~> 1.3')
  spec.add_dependency('rqrcode', '~> 0.10')
  spec.add_dependency('sixword', '~> 0.3')
  spec.add_dependency('sorbet-runtime', '~> 0.5')
  spec.add_dependency('subprocess', '~> 1.3')

  spec.required_ruby_version = '>= 2.7'
end

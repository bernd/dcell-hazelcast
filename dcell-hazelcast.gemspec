# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dcell/hazelcast/version'

Gem::Specification.new do |spec|
  spec.name          = 'dcell-hazelcast'
  spec.version       = DCell::Hazelcast::VERSION
  spec.authors       = ['Bernd Ahlers']
  spec.email         = ['bernd@tuneafish.de']
  spec.description   = %q{Hazelcast registry for DCell}
  spec.summary       = %q{A Hazelcast registry for DCell.}
  spec.homepage      = 'https://github.com/bernd/dcell-hazelcast'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'

  spec.add_runtime_dependency 'dcell'
end

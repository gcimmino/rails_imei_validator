# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_imei_validator/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_imei_validator"
  spec.version       = RailsImeiValidator::VERSION
  spec.authors       = ["Giovanni Cimmino"]
  spec.email         = ["cimminogi@gmail.com"]

  spec.summary       = %q{Rails imei validator.}
  spec.description   = %q{Rails imei validator based on Luhn algorithm.}
  spec.homepage      = "https://github.com/gcimmino/rails_imei_validator"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency(%q<activemodel>, [">= 3.0.0"])

  spec.add_development_dependency "pry"
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end

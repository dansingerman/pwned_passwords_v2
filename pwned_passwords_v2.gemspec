# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pwned_passwords_v2/version'

Gem::Specification.new do |spec|
  spec.name          = "pwned_passwords_v2"
  spec.version       = PwnedPasswordsV2::VERSION
  spec.authors       = ["Dan Singerman"]
  spec.email         = ["dan@reasonfactory.com"]

  spec.summary       = "Wrapper for Troy Hunt's api.pwnedpasswords.com service"
  spec.description   = "Uses api.pwnedpasswords.com to identify if a password has been pwned, but only sends the first 5 characters of the SHA1 hash"
  spec.license       = "MIT"

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

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end

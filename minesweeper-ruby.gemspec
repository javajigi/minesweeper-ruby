# coding: utf-8
dir = File.expand_path('../lib/minesweeper/ruby', __FILE__)
$LOAD_PATH.unshift(dir) unless $LOAD_PATH.include?(dir)
require 'version'

Gem::Specification.new do |spec|
  spec.name          = "minesweeper-ruby"
  spec.version       = Minesweeper::Ruby::VERSION
  spec.authors       = ["Dongkuk"]
  spec.email         = ["dongkuk5411@nhnnext.org"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

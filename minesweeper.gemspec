# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
test = File.expand_path('../spec', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
$LOAD_PATH.unshift(test) unless $LOAD_PATH.include?(test)
require 'minesweeper/version'

Gem::Specification.new do |spec|
  spec.name          = "minesweeper"
  spec.version       = Minesweeper::VERSION
  spec.authors       = ["Dongkuk"]
  spec.email         = ["dongkuk5411@nhnnext.org"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

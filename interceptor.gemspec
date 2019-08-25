# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'interceptor/version'

Gem::Specification.new do |spec|
  spec.name          = "interceptor"
  spec.version       = Interceptor::VERSION
  spec.authors       = ["James Moriarty"]
  spec.email         = ["james.moriarty@rea-group.com"]

  spec.summary       = "Intercept methods"
  spec.description   = "Intercept methods"
  spec.homepage      = "https://github.com/jamesmoriarty/interceptor"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.9"
  spec.add_development_dependency "rake", ">= 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "pry"
end

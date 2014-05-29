# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chinese_numerals/version'

Gem::Specification.new do |spec|
  spec.name          = "chinese_numerals"
  spec.version       = ChineseNumerals::VERSION
  spec.authors       = ["Fox Chao"]
  spec.email         = ["fox@mcuapps.com"]
  spec.summary       = %q{Convert integers to Chinese Numerals}
  spec.description   = %q{A little tool from Steam Computing, Co., Inc.}
  spec.homepage      = "https://rubygems.org/gems/chinese_numerals"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "minitest", "~> 5.3"
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'matriz_lpp/version'

Gem::Specification.new do |spec|
  spec.name          = "matriz_lpp"
  spec.version       = MatrizLpp::VERSION
  spec.authors       = ["Néstor Álvarez Díaz","Francisco Alderete González"]
  spec.email         = ["alu0100597943@ull.edu.es"]
  spec.description   = %q{Construccion de una Gema para trabajar con matrices}
  spec.summary       = %q{Gema: Matrices}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vector/version'

Gem::Specification.new do |spec|
  spec.name          = 'vector'
  spec.version       = Vector::VERSION
  spec.authors       = ['Krzysztof Niksiński']

  spec.email         = ['knx@digitalheads.pl']

  spec.summary       = 'Vector arithetic library'
  spec.description   = '
    Vector class with multiple operations such as: plus, minus, scalar
    multiply, magnitude and direction, inner product, dot product,
    parallel and orthogonal vectors, projections and cross products
  '
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'guard-bundler'
  spec.add_development_dependency 'pry'
  # spec.add_development_dependency "pry-remote"
  # spec.add_development_dependency "pry-nav"
end

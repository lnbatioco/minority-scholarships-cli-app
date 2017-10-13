 # coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minority-scholarships-cli-app/version'

Gem::Specification.new do |spec|
  spec.name          = "minority-scholarships-cli-app"
  spec.version       = MinorityScholarshipsCliApp::VERSION
  spec.authors       = ["'Loryleen Batioco'"]
  spec.email         = ["'loryleenbatioco@gmail.com'"]

  spec.summary       = %q{Scholarships for minorities.}
  spec.description   = %q{Scholarships for minorities.}
  spec.homepage      = "https://github.com/lnbatioco/minority-scholarships-cli-app"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "colorize"
end

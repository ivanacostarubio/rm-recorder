# -*- encoding: utf-8 -*-
VERSION = "0.1"

Gem::Specification.new do |spec|
  spec.name          = "rm-recorder"
  spec.version       = VERSION
  spec.authors       = ["Ivan Acosta-Rubio"]
  spec.email         = ["ivan@softwarecriollo.com"]
  spec.description   = %q{Record the screen on OSX with RubyMotion}
  spec.summary       = %q{Record the screen on OSX with RubyMotion}
  spec.homepage      = "https://github.com/ivanacostarubio/rm-recorder"
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
end

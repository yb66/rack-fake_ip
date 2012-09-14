# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rack/fake_ip/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Iain Barnett"]
  gem.email         = ["iainspeed@gmail.com"]
  gem.description   = %q{Inject fake ips when in development/testing}
  gem.summary       = %q{Inject fake ips when in development/testing, so you can see how parts of the app dependent on an "real" IP address will react.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rack-fake_ip"
  gem.require_paths = ["lib"]
  gem.version       = Rack::FakeIP::VERSION
  gem.add_dependency("rack")
  gem.add_development_dependency("wirble")
  gem.add_development_dependency("yard")
  gem.add_development_dependency("rake")
  gem.add_development_dependency("rspec")
  gem.add_development_dependency("rack-test")
  gem.add_development_dependency("simplecov")
end

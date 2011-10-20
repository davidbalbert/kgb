# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "kgb/version"

Gem::Specification.new do |s|
  s.name        = "kgb"
  s.version     = KGB::VERSION
  s.authors     = ["David Albert"]
  s.email       = ["davidbalbert@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A little library for counting method invocations}
  s.description = %q{A little library for spying on your classes and counting method invocations}

  s.rubyforge_project = "kgb"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rcapture", "~> 1.0.4"

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end

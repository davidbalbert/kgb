# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "kgb/version"

Gem::Specification.new do |s|
  s.name        = "KGB"
  s.version     = KGB::VERSION
  s.authors     = ["David Albert"]
  s.email       = ["davidbalbert@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{KGB spies on your classes and tells you what methods are being called}
  s.description = %q{KGB spies on your classes and tells you what methods are being called}

  s.rubyforge_project = "kgb"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rcapture"

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end

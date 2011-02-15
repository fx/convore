# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "convore/version"

Gem::Specification.new do |s|
  s.name        = "convore"
  s.version     = Convore::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Marian Rudzynski"]
  s.email       = ["mr@impaled.org"]
  s.homepage    = ""
  s.summary     = %q{A hasty convore.com API implementation in ruby}
  s.description = %q{}

  # s.rubyforge_project = "convore"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

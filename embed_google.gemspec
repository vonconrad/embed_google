# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "embed_google"

Gem::Specification.new do |s|
  s.name        = "embed_google"
  s.version     = EmbedGoogle::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sebastian von Conrad"]
  s.email       = ["sebastian@vonconrad.com"]
  s.homepage    = "http://github.com/vonconrad/embed_google"
  s.summary     = %q{Gem for embedding various Google services (e.g. analytics tracking) in Rack apps}
  s.description = %q{This gem allows easy and flexible embedding of Google services (currently only analytics tracking) in Rack apps, including Ruby on Rails}

  s.rubyforge_project = "embed_google"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "fuubar"
end

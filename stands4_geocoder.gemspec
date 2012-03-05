# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "stands4_geocoder/version"

Gem::Specification.new do |s|
  s.name        = "stands4_geocoder"
  s.version     = Stands4Geocoder::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Barrett Clark"]
  s.email       = ["bclark@geoforce.com"]
  s.homepage    = ""
  s.summary     = %q{Reverse Geocoding using Stands4}
  s.description = %q{Use the Stands4 geocoding service to reverse geocode a latitude/longitude coordinate}

  s.rubyforge_project = "stands4_geocoder"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "httparty", "~> 0.8.1"
  s.add_development_dependency "webmock", "~> 1.7.10"
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "js-preflight/version"

Gem::Specification.new do |s|
  s.name        = "js-preflight"
  s.version     = Js::Preflight::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Scott Burton", "Doug Crockford", "Andy Walker"]
  s.email       = ["scottburton11@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Easy preflight command-line script for jslint and jsmin}
  s.description = %q{Easy preflight command-line script for jslint and jsmin. Provides a packed, minified javascript file on STDOUT, or writes .js and provided .html files to a provided directory.}

  s.rubyforge_project = "js-preflight"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.bindir  = "bin"
end

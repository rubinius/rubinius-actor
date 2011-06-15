# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rubinius-actor}
  s.version = "0.0.1"
  s.authors = ["MenTaLguY"]
  s.date = Time.now
  s.description = "Rubinius's Actor implementation"
  s.email = ["mental@rydia.net"]
  s.files = Dir['{lib}/**/*'] + Dir['{*.txt,*.gemspec,Rakefile}']
  s.homepage = "http://github.com/rubinius/rubinius-actor"
  s.require_paths = ["lib"]
  s.summary = "Rubinius's Actor implementation"
  s.add_dependency 'rubinius-core-api'
end
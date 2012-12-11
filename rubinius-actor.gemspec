# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rubinius-actor}
  s.version = "0.0.2"
  s.authors = ["Evan Phoenix", "MenTaLguY"]
  s.date = Time.now
  s.description = "Rubinius's Actor implementation"
  s.email = ["evan@fallingsnow.net", "mental@rydia.net"]
  s.files = Dir['{lib,examples}/**/*'] + Dir['{*.txt,*.gemspec,Rakefile}']
  s.homepage = "http://github.com/rubinius/rubinius-actor"
  s.require_paths = ["lib"]
  s.summary = "Rubinius's Actor implementation"
  s.add_dependency 'rubinius-core-api'
  s.license = 'BSD 3-Clause'
end

$:.push File.expand_path("../lib", __FILE__)
require 'renoval/version'

Gem::Specification.new do |s|
  s.name        = 'reno'
  s.version     = Renoval::VERSION
  s.date        = '2016-03-23'
  s.summary     = "Release Notes/changelog Validator"
  s.description = "A tool to validate the content in the renogen generated files."
  s.authors     = "Miquel Oliete"
  s.email       = 'miqueloliete@gmail.com'
  s.files       = Dir.glob("{bin,lib,spec}/**/**/**") + %w(README.md LICENSE)
  s.homepage    = 'https://github.com/mob1970/renoval'
  s.license     = 'GPL-3.0'
  s.executables << 'renoval'
  s.required_ruby_version = '~> 2.0'

  s.add_development_dependency 'rspec', '~> 3.0'
end

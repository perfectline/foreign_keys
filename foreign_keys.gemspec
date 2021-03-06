# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "foreign_keys"
  s.version = "2.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tanel Suurhans", "Tarmo Lehtpuu"]
  s.date = "2012-07-12"
  s.description = "Foreign key support plugin for Rails, with schema dumper integration"
  s.email = ["tanel.suurhans@perfectline.ee", "tarmo.lehtpuu@perfectline.ee"]
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "README.markdown",
    "init.rb",
    "lib/foreign_keys.rb",
    "lib/foreign_keys/connection_adapters/abstract.rb",
    "lib/foreign_keys/connection_adapters/mysql.rb",
    "lib/foreign_keys/connection_adapters/postgresql.rb",
    "lib/foreign_keys/schema_dumper.rb"
  ]
  s.homepage = "http://github.com/perfectline/foreign_keys/tree/master"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Foreign key support for Rails"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end


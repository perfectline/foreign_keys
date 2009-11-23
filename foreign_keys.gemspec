# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{foreign_keys}
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tanel Suurhans", "Tarmo Lehtpuu"]
  s.date = %q{2009-11-20}
  s.description = %q{Foreign key support plugin for Rails, with schema dumper integration}
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
  s.homepage = %q{http://github.com/perfectline/foreign_keys/tree/master}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Foreign key support for Rails}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

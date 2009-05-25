# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{foreign_keys}
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Walters"]
  s.date = %q{2009-05-25}
  s.description = %q{Foreign key support plugin for Rails and MySQL, with schema dumper integration}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    ".gitignore",
     "README.markdown",
     "Rakefile",
     "VERSION.yml",
     "foreign_keys.gemspec",
     "init.rb",
     "lib/foreign_keys/mysql_adapter.rb",
     "lib/foreign_keys/postgresql_adapter.rb",
     "lib/foreign_keys/schema_dumper.rb",
     "lib/foreign_keys/schema_statements.rb"
  ]
  s.homepage = %q{http://github.com/dwalters/foreign_keys/tree/master}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Foreign key sypport for Rails (MySQL, PostgreSQL)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

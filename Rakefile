require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |jewel|
    jewel.name = 'foreign_keys'
    jewel.summary = 'Foreign key sypport for Rails (MySQL, PostgreSQL)'
    jewel.homepage = 'http://github.com/dwalters/foreign_keys/tree/master'
    jewel.description = 'Foreign key support plugin for Rails and MySQL, with schema dumper integration'
    jewel.authors = ["Dan Walters"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

desc 'Default: run unit tests.'
task :default => :rdoc

desc 'Generate documentation for the smurf plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Foreign keys'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.markdown')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

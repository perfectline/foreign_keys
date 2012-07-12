require 'rake'
require 'rake/testtask'
require 'rdoc/task'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |jewel|
    jewel.name        = 'foreign_keys'
    jewel.summary     = 'Foreign key support for Rails'
    jewel.email       = ['tanel.suurhans@perfectline.ee', 'tarmo.lehtpuu@perfectline.ee']
    jewel.homepage    = 'http://github.com/perfectline/foreign_keys/tree/master'
    jewel.description = 'Foreign key support plugin for Rails, with schema dumper integration'
    jewel.authors     = ["Tanel Suurhans", "Tarmo Lehtpuu"]
    jewel.files       = FileList["lib/**/*.rb", "*.rb", "MIT-LICENCE", "README.markdown"]

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

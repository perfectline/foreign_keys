require 'active_record'
require 'active_record/connection_adapters/abstract_adapter'
require 'active_record/connection_adapters/mysql_adapter' if defined? Mysql
require 'active_record/connection_adapters/postgresql_adapter' if defined? PG

require "foreign_keys/connection_adapters/abstract"
require "foreign_keys/connection_adapters/mysql" if defined? Mysql
require "foreign_keys/connection_adapters/postgresql" if defined? PG

require "foreign_keys/schema_dumper"


ActiveRecord::ConnectionAdapters::AbstractAdapter.__send__(:include, Perfectline::ConnectionAdapters::AbstractAdapter)

if defined?(ActiveRecord::ConnectionAdapters::MysqlAdapter)
  ActiveRecord::ConnectionAdapters::MysqlAdapter.__send__(:include, Perfectline::ConnectionAdapters::MysqlAdapter)
end

if defined?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
  ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.__send__(:include, Perfectline::ConnectionAdapters::PostgreSQLAdapter)
end

ActiveRecord::SchemaDumper.__send__(:include, Perfectline::SchemaDumper)

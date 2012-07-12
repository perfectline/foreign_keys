module Perfectline
  module ConnectionAdapters
    module MysqlAdapter

      def self.included(base)
        base.__send__(:include, InstanceMethods)
      end

      module InstanceMethods

        def remove_foreign_key(table_name, *args)
          options = args.extract_options!
          name = options.delete(:name) || foreign_key_name(table_name, args.first)

          execute("ALTER TABLE #{quote_table_name(table_name)} DROP FOREIGN KEY #{quote_column_name(name)}")
          execute("ALTER TABLE #{quote_table_name(table_name)} DROP KEY #{quote_column_name(name)}")
        end

        def foreign_keys(table_name)
          sql = execute("SHOW CREATE TABLE #{quote_table_name(table_name)}").fetch_hash["Create Table"]

          [].tap do |fks|
            sql.scan(/CONSTRAINT `(\w+)` FOREIGN KEY \((.*?)\) REFERENCES `(\w+)` \((.*?)\)(?:\s+ON DELETE\s+(.*?))?(?:\s+ON UPDATE\s+(.*?))?[,\)\n]/) do |name, cols, refs, keys, delete, update|

              cols = [].tap { |array| cols.scan(/`(\w+)`/) { |match| array << match.first.to_sym }}
              keys = [].tap { |array| keys.scan(/`(\w+)`/) { |match| array << match.first.to_sym }}

              fks.push({
                      :name       => name,
                      :columns    => cols,
                      :keys       => keys,
                      :references => refs,                      
                      :on_update  => update,
                      :on_delete  => delete
              })
            end
          end
        end
        
      end
    end
  end
end

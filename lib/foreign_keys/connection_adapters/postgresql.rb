module Perfectline
  module ConnectionAdapters
    module PostgreSQLAdapter

      def self.included(base)
        base.__send__(:include, InstanceMethods)
      end

      module InstanceMethods

        def remove_foreign_key(table_name, *args)
          options = args.extract_options!
          name = options.delete(:name) || foreign_key_name(table_name, args.first)

          execute("ALTER TABLE #{quote_table_name(table_name)} DROP CONSTRAINT #{quote_column_name(name)}")
        end

        def foreign_keys(table_name)
          sql = %Q{
          SELECT t.constraint_name AS name,
            k.table_name AS from_table,
            k.column_name AS from_column,
            c.table_name AS to_table,
            c.column_name AS to_column,
            r.update_rule AS update_rule,
            r.delete_rule AS delete_rule
          FROM
            information_schema.table_constraints t,
            information_schema.constraint_column_usage c,
            information_schema.key_column_usage k,
            information_schema.referential_constraints r
          WHERE
            t.constraint_name = c.constraint_name AND
            k.constraint_name = c.constraint_name AND
            r.constraint_name = c.constraint_name AND
            t.constraint_type = 'FOREIGN KEY' AND
            t.table_name = '#{table_name}'
          }

          foreign_keys = {}.tap do |foreign_keys|
            select_all(sql).each do |row|
              if foreign_keys.has_key?(row["name"])
                foreign_keys[row["name"]][:columns] << row["from_column"]
                foreign_keys[row["name"]][:keys]    << row["to_column"]
              else
                foreign_keys.store(row["name"], {
                        :name       => row["name"],
                        :columns    => [row["from_column"]],
                        :references => row["to_table"],
                        :keys       => [row["to_column"]],
                        :on_update  => row["update_rule"],
                        :on_delete  => row["delete_rule"]
                })
              end
            end
          end

          foreign_keys.each_value do |value|
            columns = Array(value[:columns]).uniq.compact
            keys    = Array(value[:keys]).uniq.compact

            value[:columns] = columns.size == 1 ? columns.first : columns
            value[:keys]   = keys.size == 1 ? keys.first : keys

            value.delete(:on_update) if value[:on_update] == "NO ACTION"
            value.delete(:on_delete) if value[:on_delete] == "NO ACTION"
          end

          return foreign_keys.values.to_a
        end

      end
    end
  end
end

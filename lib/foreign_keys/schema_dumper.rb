module Perfectline
  module SchemaDumper

    def self.included(base)
      base.__send__(:include, InstanceMethods)
      base.__send__(:alias_method_chain, :tables, :foreign_keys)
    end

    module InstanceMethods
      def tables_with_foreign_keys(stream)
        tables_without_foreign_keys(stream)
        @connection.tables.sort.each do |table|
          foreign_keys(table, stream)
        end
      end

      def foreign_keys(table_name, stream)
        @connection.foreign_keys(table_name).each do |foreign_key|          
          stream.print " add_foreign_key #{table_name.inspect}, #{foreign_key[:columns].inspect}"
          if foreign_key[:references] && foreign_key[:references] != foreign_key[:columns].first.to_s.gsub(/_id$/, "").tableize
            stream.print ", :references => #{foreign_key[:references].inspect}"
          end
          if foreign_key[:keys] && foreign_key[:keys] != ["id"]
            stream.print ", :keys => #{foreign_key[:keys].inspect}"
          end
          if foreign_key[:name]
            stream.print ", :name => #{foreign_key[:name].inspect}"
          end

          stream.print ", :on_delete => #{foreign_key[:on_delete].downcase.gsub(/ /, '_').to_sym.inspect}" if foreign_key[:on_delete]
          stream.print ", :on_update => #{foreign_key[:on_update].downcase.gsub(/ /, '_').to_sym.inspect}" if foreign_key[:on_update]
          stream.puts
        end
      end
    end

  end
end
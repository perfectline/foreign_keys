module Perfectline
  module ConnectionAdapters
    module AbstractAdapter

      # Adds a foreign key to given table.
      # Columns can be a String or a Symbol, or an Array of either.
      #
      # The references tables and columns are decided using the usual Rails conventions.
      # These can be explicitly overriden via +:references+ and/or +:keys+ options.
      #
      # Name of the FK can be specified via +:name+ option, if this is not provided, foreign_key_name method is used.
      #
      # You can also specify update and delete hooks with +:on_delete+ and +:on_update+ options.
      # Valid values for these are +:restrict+, +:set_null+, +:cascade+.
      #
      # Examples:
      # add_foreign_key :albums, :user_id
      # add_foreign_key :albums, :author_id, :references => :users
      # add_foreign_key :albums, [:first_name, :last_name], :references => :users, :keys => [:first_name, :last_name], :name => "composite_fk"
      def add_foreign_key(table_name, columns, options = {})
        name      = options.delete(:name) || foreign_key_name(table_name, Array(columns))
        reference = options.delete(:references) || Array(columns).first.to_s.gsub(/_id$/, '').tableize
        columns   = Array(columns).collect{ |column| quote_column_name(column) }.join(", ")
        keys      = Array(options.delete(:keys) || :id).collect{ |key| quote_column_name(key) }.join(", ")

        on_delete = options.delete(:on_delete)
        on_update = options.delete(:on_update)

        sql = "ALTER TABLE #{quote_table_name(table_name)} "
        sql << "ADD CONSTRAINT #{quote_column_name(name)} "
        sql << "FOREIGN KEY (#{columns}) REFERENCES #{quote_table_name(reference)} (#{keys})"
        sql << " ON DELETE #{on_delete.to_s.gsub(/_/, " ")}" unless on_delete.nil?
        sql << " ON UPDATE #{on_update.to_s.gsub(/_/, " ")}" unless on_update.nil?

        execute(sql)
      end

      # Removes a foreign key from the table.
      # Accepts either a column name Symbol/String or an Array of either (will use foreign_key_name method to generate the constraint name).
      # Additionally you can provide the +:name+ option with the FK name.
      #
      # remove_foreign_key :albums, :name => "albums_user_id_fk"
      # remove_foreign_key :albums, :user_id
      def remove_foreign_key(table_name, *options)
      end

      # Generates a foreign key from given table name and columns
      def foreign_key_name(table_name, columns)
        "#{table_name}_#{Array(columns).map(&:to_s).join("_")}_fk"
      end

    end
  end
end
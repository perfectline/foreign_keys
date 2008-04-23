ActiveRecord::ConnectionAdapters::SchemaStatements.module_eval do
  # Adds a new foreign key to a table.
  def add_foreign_key(table_name, columns, options = {})
    columns = Array(columns)
    name = options[:name] || index_name(table_name, :column => columns)
    column_list = columns.collect { |column| quote_column_name(column) }.join(", ")
    keys = Array(options[:keys] || :id)
    key_list = keys.collect { |key| quote_column_name(key) }.join(", ")
    references = if options[:references]
      options[:references]
    else
      columns.first.to_s.gsub(/_id$/, '').tableize
    end

    sql = "ALTER TABLE #{quote_table_name(table_name)} ADD CONSTRAINT #{quote_column_name(name)} FOREIGN KEY (#{column_list}) REFERENCES #{quote_table_name(references)} (#{key_list})"
    sql << " ON DELETE #{options[:on_delete].to_s.gsub(/_/,' ')}" if options[:on_delete]
    sql << " ON UPDATE #{options[:on_update].to_s.gsub(/_/,' ')}" if options[:on_update]
    execute sql
  end

  # Remove the given foreign key from the table.
  def remove_foreign_key(table_name, *args)
    options = args.extract_options!
    name = if options[:name]
      options[:name]
    else
      columns = args.first
      index_name(table_name, :column => Array(columns))
    end

    execute "ALTER TABLE #{quote_table_name(table_name)} DROP FOREIGN KEY #{quote_column_name(name)}"
  end
end

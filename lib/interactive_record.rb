require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord
  
    def self.table_name 
        self.to_s.downcase.pluralize
    end

    def self.column_names
        DB[:conn].results_as_hash = true
       
        sql = "PRAGMA table_info('#{table_name}')"
       
        table_info = DB[:conn].execute(sql)
        column_names = []
       
        table_info.each do |row|
          column_names << row["name"]
        end
        column_names.compact
      end

<<<<<<< HEAD
    def initialize(options={})
=======
    def intialize(options={})
>>>>>>> dc2aa2ab949d42616e062fcbbf58f75da7b076a8
        options.each do |k, v|
            self.send("#{k}=", v)
        end
    end

    self.column_names.each do |name|
        attr_accessor name.to_sym
    end

    def self.find_by_name(name)
        DB[:conn].execute("SELECT * FROM #{self.table_name} WHERE name = ?", [name])
    end

    def table_name_for_insert
        self.class.table_name
    end

    def values_for_insert
        values = []
        self.class.column_names.each do |name|
            values << "'#{send(name)}'" unless send(name).nil?
        end
        values.join(", ")
    end

<<<<<<< HEAD
    def col_names_for_insert
=======
    def column_names_fpr_insert
>>>>>>> dc2aa2ab949d42616e062fcbbf58f75da7b076a8
        self.class.column_names.delete_if {|column| column == "id"}.join(", ")
    end

    def save
<<<<<<< HEAD
        sql = "INSERT INTO #{table_name_for_insert} (#{col_names_for_insert}) VALUES (#{values_for_insert})"
        DB[:conn].execute(sql)
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM #{table_name_for_insert}")[0][0]
    end 

    def self.find_by(h)
        sql = "SELECT * FROM #{self.table_name} WHERE #{h.keys[0].to_s} = '#{h.values[0].to_s}'"
        DB[:conn].execute(sql)
    end
=======
        DB[:conn].execute("INSERT INTO #{table_name_for_insert} (#{col_names_for_insert}) VALUES (?)", [values_for_insert])
       
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM #{table_name_for_insert}")[0][0]
    end 
>>>>>>> dc2aa2ab949d42616e062fcbbf58f75da7b076a8
end
require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'interactive_record.rb'

class Student < InteractiveRecord
<<<<<<< HEAD

    self.column_names.each do |name|
=======
  self.column_names.each do |name|
>>>>>>> dc2aa2ab949d42616e062fcbbf58f75da7b076a8
        attr_accessor name.to_sym
    end
end

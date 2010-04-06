module Spec
  module Example
    module ExampleMethods
      def execute_with_clean_data(*args)
        COUCHDB_SERVER.delete!
        COUCHDB_SERVER.create!
        ProjectTemplate.create
        execute_without_clean_data(*args)
      end
      
      alias_method_chain :execute, :clean_data
    end
  end
end
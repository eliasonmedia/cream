module Cream::Generators 
  module Config
    module Helpers

      ORM_MAP = {
        :data_mapper  => 'dm-devise',
        :mongo_mapper => 'mm-devise',
        :mongoid      => 'rails3-mongoid-devise'                
      }

      def has_user? user
        return true if user == :admin && !admin_user?
        begin
          read_model(user) =~ /devise/
        rescue Exception => e
          logger.info "Exception for has_user? #{user}: #{e.message}"
          false
        end
      end

      def strategy
        options[:strategy]      
      end

      def logfile
        options[:logfile]      
      end

      def default_roles
        options[:default_roles] ? '--default-roles' : '--no-default-roles'
      end

      def roles
        options[:roles].join(' ')
      end

      def orm
        options[:orm]
      end

      def roles_config?
        options[:roles_config]
      end

      def permission_config?
        options[:permission_config]
      end

      def admin_user?
        options[:admin]
      end

      def here
        File.dirname(__FILE__)
      end

      def root_dir
        File.dirname(__FILE__).up(4)
      end
    end
  end
end
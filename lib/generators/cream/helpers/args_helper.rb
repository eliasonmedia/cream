module Cream
  module GeneratorHelper
    module Args 
      def logfile
        options[:logfile]
      end

      # def default_user_types?
      #   options[:default_user_types]
      # end

      def roles         
        # defaults = default_roles? ? ['guest', 'admin'] : [] 
        # (options[:roles] + defaults).flat_uniq
        options[:roles]
      end
      
      def has_user_model?
        model_file?(user_class.as_filename)
      end

      def set_orm
        self.class.use_orm :"#{orm}"
      end

      # def admin_user_option
      #   admin_user? ? "--admin-user #{admin_user}" : ''
      # end

      def roles_list
        roles.join(' ')
      end

      def gems?
        options[:gems]        
      end

      def logfile
        options[:logfile]
      end

      def logging?
        options[:logging]
      end

      def logging_on?
        logfile && logging?
      end

      def document_store?
        [:mongoid, :mongo_mapper, :couch_db].include? orm
      end

      def active_record? 
        active_record.include? orm
      end

      def mongoid? 
        orm == :mongoid
      end
      
      def strategy
        options[:strategy]
      end        

      def user_types 
        # defaults = default_user_types? ? ['admin'] : []
        # (options[:user_types] + defaults).flat_uniq        
        options[:user_types]
      end        

      # def admin_user?
      #   options[:admin_user]
      # end
      
      def sym_roles
        roles.map(&:to_sym)
      end

      def guest_user?
        options[:guest_user]
      end

      def user_types_code
        user_types.map {|ut| "'#{ut}'"}.join(', ')
      end

      def user_types_list
        user_types.map {|ut| "#{ut}"}.join(' ')
      end

      def user_class
        options[:user_class] || 'User'
      end

      def admin_class
        options[:admin_class] || 'Admin'
      end

      def role_class
        options[:role_class] || 'Role'
      end

      def user_role_class
        options[:user_role_class] || 'UserRole'
      end                        
    end
  end
end
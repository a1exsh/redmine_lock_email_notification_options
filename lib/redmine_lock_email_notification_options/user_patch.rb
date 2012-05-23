module RedmineLockEmailNotificationOptions
  module UserPatch
    unloadable

    def self.included(base)
      base.class_eval do
        extend ClassMethods
        class << self
          alias_method_chain :valid_notification_options, :lock
        end
      end
    end

    module ClassMethods
      def self.extended(base)
      end

      def valid_notification_options_with_lock(user=nil)
        valid_notification_options_without_lock(user).tap do |options|
          options.reject! {|o| o.first != Setting.default_notification_option} unless User.current.admin?
        end
      end
    end
  end
end

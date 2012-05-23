require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare do
  require_dependency 'user'

  User.send(:include, RedmineLockEmailNotificationOptions::UserPatch)
end

Redmine::Plugin.register :redmine_lock_email_notification_options do
  name 'Redmine Lock Email Notification Options plugin'
  author 'Alex Shulgin <ash@commandprompt.com>'
  description 'Lock user account email notification option at the default setting'
  version '0.0.1'
#  url 'http://example.com/path/to/plugin'
#  author_url 'http://example.com/about'
end

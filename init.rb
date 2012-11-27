require 'redmine'

Redmine::Plugin.register :redmine_lock_email_notification_options do
  name 'Redmine Lock Email Notification Options plugin'
  author 'Alex Shulgin <ash@commandprompt.com>'
  description 'Lock user account email notification option at the default setting'
  version '0.2.0'
#  url 'http://example.com/path/to/plugin'
#  author_url 'http://example.com/about'
end

prepare_block = Proc.new do
  User.send(:include, RedmineLockEmailNotificationOptions::UserPatch)
end

if Rails.env.development?
  ActionDispatch::Reloader.to_prepare { prepare_block.call }
else
  prepare_block.call
end

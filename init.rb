Redmine::Plugin.register :redmine_customize_core_fields do
  name 'Redmine Customize Core Fields plugin'
  author 'Vincent ROBERT'
  description 'This Redmine plugin lets you customize core fields'
  version '1.0.0'
  url 'https://github.com/nanego/redmine_customize_core_fields'
  author_url 'https://github.com/nanego'
  requires_redmine_plugin :redmine_base_deface, :version_or_higher => '0.0.1'
  requires_redmine_plugin :redmine_base_rspec, :version_or_higher => '0.0.4' if Rails.env.test?
  menu :admin_menu, :redmine_customize_core_fields, {:controller => 'core_fields', :action => 'index' }, :after => :custom_fields, :caption => :field_core_fields
end

# Custom patches
require_dependency 'redmine_customize_core_fields/hooks'
Rails.application.config.to_prepare do
  require_dependency 'redmine_customize_core_fields/issue_patch'
end
require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "rails/test_unit/railtie"

Bundler.require(:default, Rails.env) if defined?(Bundler)

module Pulse
  class Application < Rails::Application
    config.autoload_paths += [config.root.join('lib')]
    config.encoding = 'utf-8'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Add additional load paths for your own custom dirs
    # config.load_paths += %W( #{RAILS_ROOT}/extras )

    # Specify gems that this application depends on and have them installed with rake gems:install
    # config.gem "pg", :version => "0.9.0",
    # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
    # config.gem "sqlite3-ruby", :lib => "sqlite3"
    # config.gem "aws-s3", :lib => "aws/s3"
    # config.gem "couchrest"
    # config.gem "timecop"
    # config.gem "rspec", :lib => false, :version => ">= 1.2.0"
    # config.gem "rspec-rails", :lib => false, :version => ">= 1.2.0"

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names.
    config.time_zone = 'UTC'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
    # config.i18n.default_locale = :de

  if Gem::VERSION >= "1.3.6"
    module Rails
      class GemDependency
        def requirement
          r = super
          (r == Gem::Requirement.default) ? nil : r
        end
      end
    end
  end

  end

   #Put the bundler related stuff here!
  begin
    # Require the preresolved locked set of gems.
    require File.expand_path('../.bundle/environment', __FILE__)
  rescue LoadError
    # Fallback on doing the resolve at runtime.
    require "rubygems"
    require "bundler"
    Bundler.setup
  end
end
# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')
require 'omniauth'
require 'omniauth-saml'

Rails::Initializer.run do |config|
  ActionController::Dispatcher.middleware.use OmniAuth::Builder do
    provider :saml,
      :issuer                             => "http://127.0.0.1:3000",
      :idp_sso_target_url                 => "https://thoughtworks.oktapreview.com/app/template_saml_2_0/k3709y0rSILKJJJLIBCZ/sso/saml",
      :idp_cert                           => "-----BEGIN CERTIFICATE-----\nMIICozCCAgygAwIBAgIGAT+fauIOMA0GCSqGSIb3DQEBBQUAMIGUMQswCQYDVQQGEwJVUzETMBEG
A1UECAwKQ2FsaWZvcm5pYTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzENMAsGA1UECgwET2t0YTEU
MBIGA1UECwwLU1NPUHJvdmlkZXIxFTATBgNVBAMMDHRob3VnaHR3b3JrczEcMBoGCSqGSIb3DQEJ
ARYNaW5mb0Bva3RhLmNvbTAeFw0xMzA3MDIxMjQ0NDlaFw00MzA3MDIxMjQ1NDlaMIGUMQswCQYD
VQQGEwJVUzETMBEGA1UECAwKQ2FsaWZvcm5pYTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzENMAsG
A1UECgwET2t0YTEUMBIGA1UECwwLU1NPUHJvdmlkZXIxFTATBgNVBAMMDHRob3VnaHR3b3JrczEc
MBoGCSqGSIb3DQEJARYNaW5mb0Bva3RhLmNvbTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEA
kAYqmCS63DBsav/zhCMNW38JQxW4hNgO15DCo2RvnkEN1jDK+pnAlRu6pGKJmpvVVx3K0zgSxNBM
XFvWCPfWdk1RaRoo+P/4pcMBAry/ysbVAJ3r1tpUuP9nMt4zuGkwL+TpnFUKVsS690fwID+mRydx
Ab1hTa3EcG5gXdu7pD0CAwEAATANBgkqhkiG9w0BAQUFAAOBgQAXWO+wxM6WSZ6MTZvdh2g1wF0d
GvZhS5LO3q2PUvq4qHx1SchiKbxje+CUHCqOOODOjQeD+SVcUBUPJ8I9OWi9aDiQjKnmpr87h8PH
+Ni1yB2C2KRHdxxSR6SfRjkyNeVEwzTyh2Y2zu+hghddKvllWQoSfwXhIcSrLKtsL71NrQ==\n-----END CERTIFICATE-----",
      :name_identifier_format             => "urn:oasis:names:tc:SAML:2.0:nameid-format:emailAddress",
      :idp_sso_target_url_runtime_params  => {:redirectUrl => :RelayState}
  end
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
  config.gem "couchrest"
  config.gem "timecop"
  config.gem "rspec", :lib => false, :version => ">= 1.2.0"
  config.gem "rspec-rails", :lib => false, :version => ">= 1.2.0"

  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
  config.frameworks -= [ :active_record ]

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


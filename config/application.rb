require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChinaParadiseApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.eager_load_paths << Rails.root.join('lib')
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    config.middleware.insert_before 0, Rack::Cors do
        allow do
            origins '*'
            resource '*', :headers => :any, :methods => [:get, :post, :put, :delete, :options], expose: ['Access-Token', 'Uid']
        end
    end
    config.paperclip_defaults = {
    storage: :s3,
    s3_region: ENV["AWS_S3_REGION"],
    s3_credentials: {
      s3_host_name: ENV["AWS_S3_HOST_NAME"],
      bucket: ENV["AWS_S3_BUCKET"],
      access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
      }
    } 
  end
end

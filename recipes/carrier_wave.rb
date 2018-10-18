module Recipes
  class CarrierWave < Base

    is_auto_runnable

    askable 'Do you want to use Carrierwave?'
    is_confirmable

    def gems
      @template.gem 'carrierwave'
      @template.gem 'asset_sync'
      @template.gem 'fog-aws'
    end

    def cook
      add_initializer
      add_application_config
      add_production_env_config
    end

    private

    def add_initializer
      @template.initializer 'carrierwave.rb', <<~CODE
      require 'carrierwave/storage/fog'
      CarrierWave.configure do |config|
        config.fog_provider = 'fog/aws'
        config.fog_directory = ENV['AWS_S3_BUCKET']
        config.fog_public = true
        config.storage = :fog
        config.cache_dir = Rails.root.join('tmp', 'cache')

        config.fog_credentials = {
          provider: 'AWS',
          aws_access_key_id: ENV['AWS_ACCESS_KEY'],
          aws_secret_access_key: ENV['AWS_SECRET_KEY'],
          region: 'eu-west-1'
        }
      end
      CODE
    end

    def add_application_config
      @template.append_file '.env.sample', "\nAWS_ACCESS_KEY=''"
      @template.append_file '.env.sample', "\nAWS_SECRET_KEY=''"
      @template.append_file '.env.sample', "\nAWS_S3_BUCKET=''"
      @template.append_file '.env.sample', "\nFOG_DIRECTORY=''"
      @template.append_file '.env', "\nAWS_ACCESS_KEY=''"
      @template.append_file '.env', "\nAWS_SECRET_KEY=''"
      @template.append_file '.env', "\nAWS_S3_BUCKET=''"
      @template.append_file '.env', "\nFOG_DIRECTORY=''"
   end

    def add_production_env_config
      @template.gsub_file 'config/environments/production.rb',
                          '# config.action_controller.asset_host = \'http://assets.example.com\'',
                          'config.action_controller.asset_host = "//#{ENV[\'FOG_DIRECTORY\']}.s3.amazonaws.com"'
    end
  end
end

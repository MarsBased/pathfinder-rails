module Recipes
  class Mailgun < Base

    def gems
      @template.gem 'mailgun-ruby'
    end

    def cook
      add_initializer
    end

    private

    def add_initializer
      @template.initializer 'mailgun.rb', <<~CODE
      Mailgun.configure do |config|
        config.api_key = 'your-secret-api-key'
      end
      CODE
    end
  end
end

module Recipes
  class Mailgun < Base

    askable 'Do you want to use Mailgun for production emails?'
    confirmable true

    def gems
      @template.gem 'mailgun-ruby'
    end

    def cook
      add_initializer
    end

    private

    def add_initializer
      @template.insert_into_file 'config/environments/production.rb',
                                  after: "Rails.application.configure do\n" do <<~CODE
        \s\sconfig.action_mailer.delivery_method = :mailgun
        \s\sconfig.action_mailer.mailgun_settings = {
        \s\s\s\sapi_key: 'api-key',
        \s\s\s\sdomain: 'domain'
        \s\s}
        CODE
      end
    end

  end
end

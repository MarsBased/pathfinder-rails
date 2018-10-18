module Recipes
  class Pundit < Base

    is_auto_runnable

    def gems
      @template.gem 'pundit'
    end

    def cook
      @template.generate 'pundit:install'
      @template.insert_into_file 'app/controllers/application_controller.rb',
        after: "class ApplicationController < ActionController::Base\n" do <<-RUBY
  include Pundit
      RUBY
      end
    end
  end
end

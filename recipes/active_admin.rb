module Recipes
  class ActiveAdmin < Base

    askable 'Will you need ActiveAdmin to have an admin area?'
    confirmable true

    def gems
      @install = true
      @template.gem 'activeadmin'
    end

    def cook
      return unless @install

      user_class_name = ask_for_user_class_name
      @template.run "rails g active_admin:install #{user_class_name}"
    end

    private

    def ask_for_user_class_name
      ask = 'What will be the main user class for Devise and ActiveAdmin?'
      @pathfinder.utils.ask_with_default(ask, default: 'AdminUser')
    end

  end
end

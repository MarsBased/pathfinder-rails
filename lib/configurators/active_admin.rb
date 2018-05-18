module Configurators
  class ActiveAdmin < Base

    askable 'What will be the main user class for Devise and ActiveAdmin?'
    default_answer 'AdminUser'
    dependable 'Recipes::ActiveAdmin'

    def cook
      admin_class_name = ask!
      @template.run "rails g active_admin:install #{admin_class_name}"
    end

  end
end

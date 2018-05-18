module Recipes
  class ActiveAdmin < Base

    askable 'Will you need ActiveAdmin to have an admin area?'
    confirmable true

    def gems
      @template.gem 'activeadmin'
    end

  end
end

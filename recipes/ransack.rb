module Recipes
  class Ransack < Base

    askable 'Do you want to use Ransack?'
    confirmable true

    def gems
      @template.gem 'ransack'
    end

  end
end

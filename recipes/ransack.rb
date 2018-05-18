module Recipes
  class Ransack < Base

    is_runnable

    askable 'Do you want to use Ransack?'
    confirmable true

    def gems
      @template.gem 'ransack'
    end

  end
end

module Recipes
  class Ransack < Base

    is_auto_runnable

    askable 'Do you want to use Ransack?'
    is_confirmable

    def gems
      @template.gem 'ransack'
    end

  end
end

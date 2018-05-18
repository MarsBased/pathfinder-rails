module Recipes
  class Paranoia < Base

    is_auto_runnable

    askable 'Do you want to use Soft Deletes?'
    is_confirmable

    def gems
      @template.gem 'paranoia'
    end

  end
end

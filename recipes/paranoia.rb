module Recipes
  class Paranoia < Base

    is_runnable

    askable 'Do you want to use Soft Deletes?'
    confirmable true

    def gems
      @template.gem 'paranoia'
    end

  end
end

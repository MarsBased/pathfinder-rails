module Recipes
  class Paranoia < Base

    askable 'Do you want to use Soft Deletes?'
    confirmable true

    def gems
      @template.gem 'paranoia'
    end

  end
end

module Recipes
  class Paranoia < Base

    askable 'Do you want to use Soft Deletes?'

    def gems
      @template.gem 'paranoia'
    end

  end
end

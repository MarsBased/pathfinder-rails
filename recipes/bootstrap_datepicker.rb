module Recipes
  class BootstrapDatepicker < Base

    askable 'Do you want to use Bootstrap datepicker?'
    confirmable true

    def gems
      @template.gem 'bootstrap-datepicker-rails', '~> 1.6.0'
    end

  end
end

module Recipes
  class Assets < Base

    def gems
      @template.gem 'bootstrap-sass', '~> 3.3.3'
      ask_for_bootstrap_datepicker
      @template.gem 'font-awesome-sass', '~> 4.7.0'
      @template.gem 'sass-rails'
      @template.gem 'autoprefixer-rails'
      @template.gem 'compass-rails', '~> 3.0.1'
      @template.gem 'magnific-popup-rails'
      @template.gem 'uglifier', '>= 1.3.0'
      @template.gem 'sdoc', '~> 0.4.0', group: :doc
    end

    private

    def ask_for_bootstrap_datepicker
      if @template.yes?('Do you want to use Bootstrap datepicker?')
        @template.gem 'bootstrap-datepicker-rails', '~> 1.6.0'
      end
    end

  end
end

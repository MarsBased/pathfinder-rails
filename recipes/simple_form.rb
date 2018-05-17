module Recipes
  class SimpleForm < Base

    def gems
      @template.gem 'simple_form'
    end

    def cook
      add_sample_i18n
    end

    private

    def add_sample_i18n
      @template.run 'rm config/locales/simple_form.en.yml'
      @template.append_to_file 'config/locales/en.yml', simple_form_template('en.yml')
    end

  end
end

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
      @template.append_to_file 'config/locales/en.yml', simple_form_locale('en.yml')
    end

    def simple_form_locale(filename)
      base_path = File.dirname(__FILE__).split('/')
      base_path.pop
      File.read(File.join(base_path, 'recipes', 'simple_form', filename))
    end

  end
end

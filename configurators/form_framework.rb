module Configurators
  class FormFramework < Base

    askable 'What framework do you want to use for your forms?'
    optionable %w(Default Marsman Bootstrap)

    def cook
      case ask!
      when 'Marsman'
        @template.initializer('simple_form.rb', simple_form_template('marsman.rb'))
      when 'Bootstrap'
        @template.generate('simple_form:install --bootstrap')
      else
        @template.generate('simple_form:install')
      end
    end

    private

    def simple_form_template(filename)
      base_path = File.dirname(__FILE__).split('/')
      base_path.pop
      File.read(File.join(base_path, 'recipes', 'simple_form', filename))
    end

  end
end

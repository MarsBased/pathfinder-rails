module Configurators
  class FormFramework < Base

    askable 'What framework do you want to use for your forms?'
    optionable %w(marsman bootstrap default)

    def cook
      case @template.ask(self.class.ask, limited_to: self.class.options)
      when 'marsman'
        @template.initializer('simple_form.rb', simple_form_template('marsman.rb'))
      when 'bootstrap'
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

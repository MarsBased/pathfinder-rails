module Recipes
  class Utils

    def initialize(template)
      @template = template
    end

    def ask(question)
      @template.ask(question)
    end

    def ask_with_confirmation(question)
      @template.yes?(question)
    end

    def ask_with_options(question, options)
      @template.ask(question, options)
    end

    def ask_with_default(question, default)
      answer = @template.ask("#{question} (Default #{default})")
      answer.empty? ? default : answer
    end

  end
end

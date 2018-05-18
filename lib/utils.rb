class Utils
  def initialize(prompt)
    @prompt = prompt
  end

  def ask(question)
    @prompt.ask(question)
  end

  def ask_with_confirmation(question)
    @prompt.select(question, %w[yes no]) == 'yes'
  end

  def ask_with_options(question, options)
    @prompt.select(question, options)
  end

  def ask_with_default(question, default)
    @prompt.ask("#{question} (#{default})", default: default)
  end
end

module Configurators
  class Monitoring < Base

    askable 'Choose Monitoring Engine:'
    optionable %w(rollbar airbrake none)

    def recipe
      case @template.ask(self.class.ask, limited_to: self.class.options)
      when 'rollbar'
        Recipes::Rollbar.new(@pathfinder)
      when 'airbrake'
        Recipes::Airbrake.new(@pathfinder)
      else
      end
    end

  end
end

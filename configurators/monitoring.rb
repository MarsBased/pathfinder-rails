module Configurators
  class Monitoring < Base

    askable 'Choose Monitoring Engine:'
    optionable %w(None Rollbar Airbrake)

    def recipe
      case ask!
      when 'Rollbar'
        Recipes::Rollbar.new(@pathfinder)
      when 'Airbrake'
        Recipes::Airbrake.new(@pathfinder)
      else
      end
    end

  end
end

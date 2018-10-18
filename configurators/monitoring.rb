module Configurators
  class Monitoring < Base

    askable 'Choose Monitoring Engine:'
    optionable %w(None Rollbar Airbrake)

    def recipe
      case ask!
      when 'Rollbar'
        @pathfinder.add_recipe(Recipes::Rollbar.new(@pathfinder))
      when 'Airbrake'
        @pathfinder.add_recipe(Recipes::Airbrake.new(@pathfinder))
      end
    end

  end
end

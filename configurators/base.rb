require_relative '../concerns/askable'
require_relative '../concerns/optionable'

module Configurators
  class Base

    include ::Askable
    include ::Optionable

    def initialize(pathfinder)
      @pathfinder = pathfinder
      @template = pathfinder.template
    end

    def cook
    end

    def recipe
    end

  end
end

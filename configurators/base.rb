require_relative '../concerns/askable'
require_relative '../concerns/optionable'
require_relative '../concerns/confirmable'

module Configurators
  class Base

    include ::Askable
    include ::Optionable
    include ::Confirmable

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

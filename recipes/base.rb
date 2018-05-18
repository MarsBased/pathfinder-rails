require_relative '../concerns/askable'
require_relative '../concerns/optionable'
require_relative '../concerns/confirmable'

module Recipes
  class Base

    include ::Askable
    include ::Optionable
    include ::Confirmable

    def initialize(pathfinder)
      @pathfinder = pathfinder
      @template = pathfinder.template
    end

    def gems
    end

    def cook
    end

  end
end

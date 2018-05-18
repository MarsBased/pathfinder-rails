require_relative '../concerns/askable'

module Recipes
  class Base

    include ::Askable

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

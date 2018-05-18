require_relative '../concerns/askable'
require_relative '../concerns/optionable'
require_relative '../concerns/confirmable'
require_relative '../concerns/dependable'

module Recipes
  class Base

    include ::Askable
    include ::Optionable
    include ::Confirmable
    include ::Dependable

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

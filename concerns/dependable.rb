module Dependable
  def self.included(base)
    base.send(:extend, ClassMethods)
    base.send(:include, InstanceMethods)
  end

  module ClassMethods
    attr_accessor :dependent

    def dependable(value)
      @dependent = value
    end
  end

  module InstanceMethods
    def dependent?
      self.class.dependent || false
    end

    def runnable?
      @pathfinder.recipes_list.map(&:class).include?(self.class.dependent.constantize)
    end
  end
end

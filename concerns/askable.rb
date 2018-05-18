module Askable
  def self.included(base)
    base.send(:extend, ClassMethods)
    base.send(:include, InstanceMethods)
  end

  module ClassMethods
    attr_accessor :ask

    def askable(value)
      @ask = value
    end
  end

  module InstanceMethods
    def ask?
      self.class.ask.present?
    end

    def ask!
      return unless ask?

      if self.class.options.any?
        @pathfinder.utils.ask_with_options(self.class.ask,
                                           limited_to: self.class.options)
      elsif self.class.confirm
        @pathfinder.utils.ask_with_confirmation(self.class.ask)
      else
        @pathfinder.utils.ask(self.class.ask)
      end
    end
  end
end

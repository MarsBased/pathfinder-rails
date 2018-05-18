module Confirmable
  def self.included(base)
    base.send(:extend, ClassMethods)
  end

  module ClassMethods
    attr_accessor :confirmable

    def is_confirmable
      @confirmable = true
    end

    def confirmable?
      @confirmable || false
    end
  end
end

module Askable
  def self.included(base)
    base.send(:extend, ClassMethods)
  end

  module ClassMethods
    attr_accessor :ask

    def askable(value)
      @ask = value
    end
  end
end

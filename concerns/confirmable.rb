module Confirmable
  def self.included(base)
    base.send(:extend, ClassMethods)
  end

  module ClassMethods
    attr_accessor :confirm

    def confirmable(value)
      @confirm = value
    end

    def confirm
      @confirm || false
    end
  end
end

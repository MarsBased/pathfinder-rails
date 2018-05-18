module Optionable
  def self.included(base)
    base.send(:extend, ClassMethods)
  end

  module ClassMethods
    attr_accessor :options

    def optionable(options)
      @options = options
    end

    def options
      @options || []
    end
  end
end

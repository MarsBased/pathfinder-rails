

module Runnable
  def self.runnables_for_module(mod)
    mod.constants.reduce([]) do |acc, c|
      klass = mod.const_get(c)
      runnable = klass.is_a?(Class) && klass.runnable ? klass : nil
      (acc << runnable).compact
    end
  end

  def self.included(base)
    base.send(:extend, ClassMethods)
  end

  module ClassMethods

    attr_accessor :runnable

    def is_runnable
      @runnable = true
    end
  end
end

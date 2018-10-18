module AutoRunnable
  def self.included(base)
    base.send(:extend, ClassMethods)
  end

  module ClassMethods
    attr_accessor :auto_runnable

    def is_auto_runnable
      @auto_runnable = true
    end
  end

  def self.auto_runnables_for_module(mod)
    mod.constants.reduce([]) do |acc, c|
      klass = mod.const_get(c)
      auto_runnable = klass.is_a?(Class) && klass.auto_runnable ? klass : nil
      (acc << auto_runnable).compact
    end
  end
end

require "interceptor/version"

module Interceptor
  def intercept(*methods, &test)
    methods.each do |method|
      mod = Module.new

      mod.class_eval do
        define_method(method) do |*args, &block|
          super(*args, &block) if test.call(*args, &block)
        end
      end

      prepend mod
    end
  end
end

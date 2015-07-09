require "interceptor/version"

module Interceptor
  def intercept(*methods, &test)
    mod = if const_defined?(:MethodInterceptor, false)
            const_get(:MethodInterceptor)
          else
            new_mod = Module.new do
              def self.to_s
                "MethodInterceptor(#{instance_methods(false).join(', ')})"
              end
            end
            const_set(:MethodInterceptor, new_mod)
          end

    methods.each do |method|
      mod.class_eval do
        define_method(method) do |*args, &block|
          super(*args, &block) if test.call(*args, &block)
        end
      end
    end

    prepend mod
  end
end

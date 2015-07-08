require 'interceptor'

class Repository
  class << self
    extend Interceptor

    intercept :save do |attributes|
      attributes.length > 0
    end

    def save(attributes)
      attributes
    end
  end
end

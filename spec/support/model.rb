require 'interceptor'

class Model
  extend Interceptor

  intercept :save do |_attrs|
    true
  end

  intercept :create do |_attrs|
    true
  end

  def save(attributes)
    attributes
  end

  def create(attributes)
    attributes
  end
end

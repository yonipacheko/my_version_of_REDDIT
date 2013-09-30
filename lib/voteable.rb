module Voteable
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend ClassMethods
    base.class_eval do
      my_class_method
    end
  end


  module InstanceMethods
    def my_instance_method
      puts 'Instance Method'
    end
  end

  module ClassMethods
    def my_class_method
      puts 'Class method!'
    end
  end
end
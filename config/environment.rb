require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(instance_name)
      self.all.detect { |s| s.name == instance_name }
    end
    
    def find_or_create_by_name(instance_name)
      if self.find_by_name(instance_name)
        self.find_by_name(instance_name)
      else
        self.create(instance_name)
      end
    end
    
  end
end

require_all 'lib'

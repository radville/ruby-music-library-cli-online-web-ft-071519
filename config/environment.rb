require 'bundler'
Bundler.require

module Concerns
  module Findable
    def self.find_by_name(song)
      self.all.detect { |s| s.name == song }
    end
    
    def self.find_or_create_by_name(item)
      if self.find_by_name(item)
        self.find_by_name(item)
      else
        self.create(item)
      end
    end
    
  end
end

require_all 'lib'

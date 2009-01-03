require 'activerecord'

module Thincloud
  module Acts
    
    # @obj.lock!(:desc => "Because I said so")
    # @obj.unlock!
    # @obj.locked?
    
    module Lockable
      
      def self.included(base) # :nodoc:
        base.extend ClassMethods
      end

      module ClassMethods
        def acts_as_lockable(options = {})
          has_many :locks, :as => :locked
          before_destroy :prevent_lock_pick
          include InstanceMethods
        end

        def lockable?
          self.included_modules.include?(InstanceMethods)
        end
      end

      module InstanceMethods #:nodoc:
        def lock!(options={})
          self.locks.create(:desc => options[:desc])
        end
        
        def unlock!
          self.locks.clear
        end
        
        def locked?
          self.locks.size > 0
        end
        
        private 
        
        def prevent_lock_pick
          raise LockedDestroyError if self.locked?
        end
      end      
    end
  end
end

class LockedDestroyError < StandardError; end
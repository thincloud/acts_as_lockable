require 'acts_as_lockable'
ActiveRecord::Base.send(:include, Thincloud::Acts::Lockable)
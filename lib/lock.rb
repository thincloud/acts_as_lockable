# == Schema Information
# Schema version: 20090103222722
#
# Table name: locks
#
#  id          :integer(4)      not null, primary key
#  locked_id   :integer(4)
#  locked_type :string(255)
#  desc        :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Lock < ActiveRecord::Base

  belongs_to :locked, :polymorphic => true

end
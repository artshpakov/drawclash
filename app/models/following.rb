class Following < ActiveRecord::Base

  belongs_to :user
  belongs_to :entity, polymorphic: true

end

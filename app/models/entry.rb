class Entry < ActiveRecord::Base

  belongs_to :user
  belongs_to :battle, counter_cache: true

  dragonfly_accessor :image

  default_scope -> { order :created_at }

end

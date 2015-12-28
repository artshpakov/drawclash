class Entry < ActiveRecord::Base

  include Likeable

  belongs_to :user
  belongs_to :battle, counter_cache: true
  belongs_to :corner

  dragonfly_accessor :image

  scope :chronologically, -> { order :created_at }

end

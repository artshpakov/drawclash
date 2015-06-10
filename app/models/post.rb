class Post < ActiveRecord::Base

  include Likeable

  belongs_to :corner

  default_scope -> { order created_at: :desc }

end

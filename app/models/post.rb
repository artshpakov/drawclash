class Post < ActiveRecord::Base

  belongs_to :corner

  default_scope -> { order created_at: :desc }

end

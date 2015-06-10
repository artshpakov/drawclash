class User < ActiveRecord::Base

  has_many :identities, dependent: :destroy
  has_many :entries
  has_and_belongs_to_many :corners
  has_many :followings
  has_many :follows, source: :entity, source_type: Corner, through: :followings

  validates :email, uniqueness: true, if: -> { email.present? }

  def follows? corner
    follows.include? corner
  end

  def name # TODO move to a decorator
    profile['name']
  end

  def avatar # TODO move to a decorator
    profile['avatar']
  end

end

class User < ActiveRecord::Base

  authenticates_with_sorcery!

  has_many :entries
  has_and_belongs_to_many :corners
  has_many :followings
  has_many :follows, source: :entity, source_type: Corner, through: :followings

  validates :username, uniqueness: true
  validates :email, uniqueness: true, if: -> { email.present? }
  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true


  def follows? corner
    follows.include? corner
  end

end

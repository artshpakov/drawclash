class User < ActiveRecord::Base

  authenticates_with_sorcery!

  has_and_belongs_to_many :corners

  validates :username, uniqueness: true
  validates :email, uniqueness: true, if: -> { email.present? }
  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

end
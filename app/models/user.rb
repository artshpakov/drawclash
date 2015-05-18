class User < ActiveRecord::Base

  authenticates_with_sorcery!

  validates :username, uniqueness: true
  validates :email, uniqueness: true, if: -> { email.present? }
  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

end

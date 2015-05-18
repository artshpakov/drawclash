class Corner < ActiveRecord::Base

  has_and_belongs_to_many :users

  dragonfly_accessor :logo

  validates :slug, uniqueness: true

  before_validation :generate_slug


  def to_param
    slug
  end

  protected

  def generate_slug
    self.slug = name.to_slug.normalize(transliterations: :russian).to_s unless slug.present?
  end

end

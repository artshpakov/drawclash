class Corner < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_many :battles
  has_many :posts

  dragonfly_accessor :logo

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug

  scope :populated, -> { where('battles_count > 0') }


  def to_param
    slug
  end

  protected

  def generate_slug
    self.slug = name.to_slug.normalize(transliterations: :russian).to_s unless slug.present?
  end

end

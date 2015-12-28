class Battle < ActiveRecord::Base

  belongs_to :corner, counter_cache: true
  has_many :entries

  validates :name, presence: true

  scope :open, -> { where("open_until > ?", Time.now) }
  scope :ordered, -> { order("(open_until > '#{ Time.now }') DESC").order(created_at: :desc) }

  before_create :set_duration
  after_create :announce


  def open?
    open_until > Time.now
  end

  def last_entry
    entries.order(id: :desc).limit(1).first
  end


  protected

  def set_duration
    self.open_until = 1.week.from_now unless open_until.present?
  end

  def announce
    corner.posts.create body: "New battle #{ name } announced!"
  end

end

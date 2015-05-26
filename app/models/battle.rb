class Battle < ActiveRecord::Base

  belongs_to :corner, counter_cache: true
  has_many :entries

  validates :name, presence: true

  scope :open, -> { where("open_until > ?", Time.now) }
  scope :ordered, -> { order("(open_until > '#{ Time.now }') DESC").order(created_at: :desc) }


  def open?
    open_until > Time.now
  end

  def last_entry
    entries.order(created_at: :desc).limit(1).first
  end

end

class Battle < ActiveRecord::Base

  belongs_to :corner, counter_cache: true
  has_many :entries

  validates :name, presence: true

  scope :open, -> { where("open_until > ?", Time.now) }
  scope :ordered, -> { order("(open_until > '#{ Time.now }') DESC").order(created_at: :desc) }

  after_create :announce


  def open?
    open_until > Time.now
  end

  def last_entry
    entries.order(id: :desc).limit(1).first
  end


  protected

  def announce
    corner.posts.create body: "New battle #{ name } announced!"
  end

end

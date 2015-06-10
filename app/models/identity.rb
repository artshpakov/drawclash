class Identity < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :uid, :provider, :user_id

  before_validation :create_user


  def self.find_or_create params
    id_params = params.slice(:provider, :uid)
    find_by(id_params) || create(uid: params['uid'], provider: params['provider'], raw_data: params['info'])
  end


  def create_user
    user = User.new email: raw_data['email'], profile: {name: raw_data['name']}
    raise user.errors.messages.to_json unless user.save
    self.user = user
  end

end

class Identity < ActiveRecord::Base
  belongs_to :user

  def self.find_for_facebook_oath(auth)
    user = Identity.where(:provider => auth.provider, :uid => auth.uid).first
    registered_user = User.where(:email => auth.info.email).first
    unless registered_user.nil?
      Identity.create!(
                        provider: auth.provider,
                        uid:      auth.uid,
                        user_id:  registered_user.id
                      )
      registered_user
    else
      user = User.create!(
                        email:      auth.info.email,
                        first_name: auth.info.first_name,
                        last_name:  auth.info.last_name,
                        password:   Devise.friendly_token[0,20]
                        )
      identity = Identity.create!(
                        provider: auth.provider,
                        uid:      auth.uid,
                        user_id:  user.id
                        )
      user
    end
  end
end

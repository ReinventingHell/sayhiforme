class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name, :email

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
         user.token = auth['credentials']['token']
         user.token_expiration = auth['credentials']['expires_at']
      end
    end
  end

end

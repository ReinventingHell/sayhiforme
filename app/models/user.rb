require 'date'

class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name, :email, :token, :token_expiration

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
      if auth['credentials']
        user.token = auth['credentials']['token'] || ""
        user.token_expiration = Time.at(auth['credentials']['expires_at']).to_date || ""
      end
    end
  end
end

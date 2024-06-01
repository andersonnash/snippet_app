class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  
  has_many :snippets

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_initialize
    user.email = auth.info.email

    if user.persisted?
      user.update(
        provider: auth.provider,
        uid: auth.uid,
        name: auth.info.name,
        image: auth.info.image,

        # oauth_token: auth.credentials.token,
        # oauth_expires_at: Time.at(auth.credentials.expires_at)
      )
    else
      existing_user = find_by(email: auth.info.email)
      if existing_user
        existing_user.update(
          provider: auth.provider,
          uid: auth.uid,
          name: auth.info.name,
          image: auth.info.image,
          # oauth_token: auth.credentials.token,
          # oauth_expires_at: Time.at(auth.credentials.expires_at)
        )
        user = existing_user
      else
        user.assign_attributes(
          name: auth.info.name,
          image: auth.info.image,
          # oauth_token: auth.credentials.token,
          # oauth_expires_at: Time.at(auth.credentials.expires_at)
        )
        user.save!
      end
    end
    user
  end
end

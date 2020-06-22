class User < ApplicationRecord
  has_many :lesson_plans
  validates :name, format: { with: /[a-zA-Z]/, message: "Your name cannot contain numbers or symbols." }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.email = auth.info.email
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end

end



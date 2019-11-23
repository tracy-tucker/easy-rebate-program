class User < ApplicationRecord
    
    has_many :user_rebates
    has_many :rebates, through: :user_rebates
    has_many :refunds

    validates :username, uniqueness: true, presence: true

    has_secure_password

    def self.create_by_google_omniauth(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex
        end
    end
end

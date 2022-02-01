class User < ApplicationRecord
    has_many :posts
    validates :email, :name, :auth_token, presence: true
    validates :auth_token, presence: true


    after_initialize :generate_auth_token

    def generate_auth_token
        #User.new
        unless auth_token.present?
            #generate
            self.auth_token = SecureRandom.hex
        end
    end
end

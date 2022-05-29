class User < ApplicationRecord
    has_secure_password
    validates :name,:email, presence: true 
    validates :email,uniqueness: true
    validates :password , length: {minimum: 4 }

    has_many :messages

end

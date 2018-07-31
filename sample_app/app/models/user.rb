class User < ApplicationRecord
    # callback method gets invoked by Active Record
    #before_save { self.email = email.downcase }  
    before_save { email.downcase! }
    validates(:name, presence: true, length: {maximum: 50})

    # (below)  more info on Rubular website,
    #  OR pg 275 Ruby on Rails Tutorial
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates(:email, presence: true, length: {maximum: 255},
              format: { with: VALID_EMAIL_REGEX },
              uniqueness:{case_sensitive: false})
    # requires bcrypt and user table have column password_digest 
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}

    # Returns the hash digest of the given string.
    # Used in tests therfore the cost is set to minimum
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ?
             BCrypt::Engine::MIN_COST :
             BCRYPT::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
end

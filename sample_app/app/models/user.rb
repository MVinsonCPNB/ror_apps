class User < ApplicationRecord
    # Validations are used to ensure that only valid data is saved
    # into your database.

    #attr_accessor creates User.remember_token access for get and set
    attr_accessor :remember_token
    # callback method gets invoked by Active Record
    # before_save { self.email = email.downcase }  
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

    # Returns a random token.
    def User.new_token
      SecureRandom.urlsafe_base64
    end

    def remember
      self.remember_token = User.new_token
          update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Returns true if a given token matches a digest
    def authenticated?(remember_token)
      return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # Forgets a user.
    def forget
      update_attribute(:remember_digest, nil)
    end
end

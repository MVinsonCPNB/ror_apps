class User < ApplicationRecord
    validates(:name, presence: true, length: {maximum: 50})

    # (below)  more info on Rubular website,
    #  OR pg 275 Ruby on Rails Tutorial
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates(:email, presence: true, length: {maximum: 255},
              format: { with: VALID_EMAIL_REGEX })
end

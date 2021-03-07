class User < ApplicationRecord
  before_save { self.email = email.downcase }
  # if the user is destroied, then the articles associate with it will be destroied as well.
  has_many :articles, dependent: :destroy
  validates :username, presence: true,
                      length: { minimum: 3, maximum: 25 },
                      uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # this is a constant
  validates :email, presence: true,
                      length: { maximum: 105 },
                      uniqueness: { case_sensitive: false },
                      format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
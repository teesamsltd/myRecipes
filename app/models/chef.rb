class Chef < ActiveRecord::Base
  has_many :recipes
  before_save { self.email = email.downcase }
  validates :chefname, presence: true, length: { minimum: 3, maximum: 40 }
  VALID_EMAIL_REGEX = /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ # /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ #/\A[\w+\-.]+@[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
                                    uniqueness: { case_sensitive: false },
                                    format: { with: VALID_EMAIL_REGEX }
  
end
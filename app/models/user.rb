class User < ActiveRecord::Base
    has_many :articles
    has_secure_password
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
    validates :email, presence: true, length: { maximum: 105 }, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Invalid email format." }
    before_save { self.email = email.downcase }
    
   end
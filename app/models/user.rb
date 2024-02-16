class User < ApplicationRecord
    has_many: Doc
    before_save :normalize_data
    validates :username,uniqueness: {case_sensitive: false}
    validates :email,uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    has_secure_password
    private 
    def normalize_data
        self.email = email.downcase
        self.username=username.capitalize
    end
end
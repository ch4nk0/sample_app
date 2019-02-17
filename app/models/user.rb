class User < ApplicationRecord
    # メールアドレスを小文字に揃える
    before_save {self.email = email.downcase}
    
    # name: validates
    validates :name, presence: true, length: {maximum: 50}
    
    # email: validates
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255},
              format: {with: VALID_EMAIL_REGEX},
              uniqueness: {case_sensitive: false}
              
    # パスワードをハッシュ化
    has_secure_password
    # password: validates
    validates :password, presence: true, length: {minimum: 6}
end

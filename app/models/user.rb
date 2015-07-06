class User < ActiveRecord::Base

attr_accessor :password

has_many :questions
has_many :answers

validates_presence_of :password
validates :name, presence: true, uniqueness: true
validates :email, presence: true
validates_confirmation_of :password

before_save :encrypt_password

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(name, password)
    user = User.where(name: name).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end



end

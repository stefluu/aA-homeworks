
class User < ApplicationRecord

  attr_accessor :password_digest, :session_token
  attr_reader :username, :password

  before_validation :ensure_session_token

  validates :username, presence: true, uniqueness: true

  validates :session_token, presence: true, uniqueness: true

  validates :password_digest, presence: { message: "Passwords can't be blank"}

  validates :password, length: { minimum: 6, allow_nil: true}


  # def password
  #   @password_digest = BCrypt::Password.create(@password)
  # end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    str_password_digest = BCrypt::Password.new(@password_digest)

    if str_password_digest.is_password?(password) && user
      return user
    end
    nil
  end

  def generate_session_token
    @session_token = SecureRandom::urlsafe_base64(12)
  end

  def reset_session_token!
    @session_token = self.generate_session_token
  end

  def ensure_session_token
    @session_token ||= self.generate_session_token
  end

  def password=(password)
    @password = password
    @password_digest = BCrypt::Password.create(@password)
  end
end

class User < ActiveRecord::Base
  include BCrypt

  validates :username, :email, presence: true, uniqueness: true
  has_many :answers

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.unlock(email, password)
    user = User.find_by(email: email)
    if user && user.password == password
      user
    else
      nil
    end
  end

end

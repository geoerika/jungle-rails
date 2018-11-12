class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false}
  validates :password, presence: true, length: { minimum: 3,
    too_short: "is too short (minimum is %{count} characters)" }
  validates :password_confirmation, presence: true

  def authenticate_with_credentials(email, password)
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end

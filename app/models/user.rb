class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts
  has_many :comments
  validates :username, :uniqueness => true
  validates :first_name, :last_name, :username, :email, {:presence => true}

  def password
    @password ||= BCrypt::Password.new(password_hash) # takes a hash created by Bcrypt
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password) # takes a string
    self.password_hash = @password
  end

  def name
    first_name + ' ' + last_name
  end

  def self.authenticate(user_info)
    user = User.find_by_username(user_info[:username])

    if user && user.password == user_info[:password] #user.password is @password... password is the text I passed
      user
    else
      nil
    end
  end
end

# user.password(word)
#   bcrypt(word) => encrypted hash
#   password_hash = bcrypt

class Post < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, :uniqueness => true
  belongs_to  :user
  has_many    :comments
end

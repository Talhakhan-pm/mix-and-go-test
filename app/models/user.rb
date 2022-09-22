# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :posts
  validates :username, presence: true, length: {minimum:3, maximum:35}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {minimum:3, maximum:40}, 
  uniqueness: {case_sensitive: false},
  format: { with: VALID_EMAIL_REGEX }

  has_secure_password
end 

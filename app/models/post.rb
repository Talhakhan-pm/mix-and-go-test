# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {minimum: 3, maximum: 30}
  validates :body, presence: true, length: {minimum: 3, maximum: 300}
end

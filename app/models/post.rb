# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tags        :string
#  user_id     :integer
#  category_id :integer
#

class Post < ActiveRecord::Base
  # Validations
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  mount_uploader :photo, PictureUploader

  # Relationships
  has_many :comments

  belongs_to :user
  belongs_to :category

  delegate :name, to: :category, prefix: :category, allow_nil: true
end

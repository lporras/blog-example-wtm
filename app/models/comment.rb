# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  message    :text
#  post_id    :integer
#  commentable_id :integer
#  commentable_type :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Comment < ActiveRecord::Base
  #belongs_to :post
  belongs_to :commentable, polymorphic: true

  belongs_to :user

  validates :message, presence: true
end

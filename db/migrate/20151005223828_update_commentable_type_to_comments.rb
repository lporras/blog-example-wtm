class UpdateCommentableTypeToComments < ActiveRecord::Migration
  def up
    #Comment.all.each do |comment|
    #  comment.update_column(:commetable_type, "Post")
    #end
    Comment.update_all({commentable_type: "Post"})
  end

  def down
    Comment.update_all({commentable_type: nil})
  end
end

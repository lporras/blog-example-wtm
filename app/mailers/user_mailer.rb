class UserMailer < ApplicationMailer

  default from: "no-reply@blogexample.com"

  def comment_email(user, comment)
    @user = user
    @comment = comment
    @post = comment.commentable
    mail(to: @user.email, subject: "Nuevo Comentario")
  end

end


class UserMailer < ApplicationMailer

  default from: "lporras16@gmail.com"

  def comment_email
    mail(to: "lporras16@gmail.com", subject: "Nuevo Comentario")
  end

end

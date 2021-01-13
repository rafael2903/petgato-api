class UserMailer < ApplicationMailer
    default from: 'petgato.cjr@gmail.com'

  def password_reset
    @user = params[:user]
    @new_password = params[:new_password]
    @url  = 'http://localhost:4000/login'
    mail(to: @user.email, subject: 'Sua nova senha do PetGato')
  end
end

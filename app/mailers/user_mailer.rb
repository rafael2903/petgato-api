class UserMailer < ApplicationMailer
    default from: 'rafaelrodigues29032@gmail.com'

  def reset_password_email
    
    @user = params[:user]
    @new_password = params[:new_password]
    @url  = 'http://localhost:4000/login'
    mail(to: @user.email, subject: 'Sua nova senha do PetGato')
  end
end
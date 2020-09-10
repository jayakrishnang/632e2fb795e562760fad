class ShowMailer < ApplicationMailer
  def notification(user, show)
    @user = user
    @show = show
    mail(from: 'no-reply@entertainment-online.com', to: @user.email, subject: 'Show about to start') do |format|
      format.text { render text: 'notification' }
      format.html { render 'notification' }
    end
  end
end

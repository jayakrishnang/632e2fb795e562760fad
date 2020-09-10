class ShowScheduler
  def initialize(show_id)
  	@show = Show.find(show_id)
  end

  def notify_users
  	@show.users.each { |user| ShowMailer.notification(user, @show).deliver }
  end
end

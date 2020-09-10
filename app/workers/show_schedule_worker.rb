class ShowScheduleWorker
  include Sidekiq::Worker

  def perform(show_id)
  	ShowScheduler.new(show_id).notify_users
  end
end

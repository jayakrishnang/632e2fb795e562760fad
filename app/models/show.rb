# frozen_string_literal: true

class Show < ApplicationRecord
  belongs_to :channel
  has_many :favorites
  has_many :users, through: :favorites

  validates :name, :start_time, presence: true

  after_create :notify_users

  def notify_users
  	ShowScheduleWorker.perform_at(self.start_time - 30.minutes, self.id)
  end
end

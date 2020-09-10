# frozen_string_literal: true

class Show < ApplicationRecord
  belongs_to :channel
  has_many :favorites

  validates :name, :start_time, presence: true
end

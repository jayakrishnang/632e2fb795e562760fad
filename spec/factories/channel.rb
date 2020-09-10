# frozen_string_literal: true

FactoryBot.define do
  factory :channel, class: Channel do
    name { Faker::TvShows::GameOfThrones.house + 'TV' }
  end
end
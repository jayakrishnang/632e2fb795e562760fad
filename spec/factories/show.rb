# frozen_string_literal: true

FactoryBot.define do
  factory :show, class: Show do
    name { Faker::TvShows::GameOfThrones.character + ' Show' }
    start_time { DateTime.now + rand(1..10).hours }
  end
end
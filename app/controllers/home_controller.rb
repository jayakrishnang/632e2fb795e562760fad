# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @shows = Show.includes(:channel)
  end
end

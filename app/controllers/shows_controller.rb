# frozen_string_literal: true

class ShowsController < ApplicationController
  def index
    @shows = Show.includes(:channel).order(created_at: :desc)
    @shows = @shows.joins(:channel).where('shows.name LIKE ? OR channels.name LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
  end

  def mark_favorite
    show = Show.find(params[:show_id])
    current_user.favorites.where(show_id: show.id).first_or_create!
    flash.notice = 'Yeay! Show set as favorite!'
    redirect_to shows_path
  end
end

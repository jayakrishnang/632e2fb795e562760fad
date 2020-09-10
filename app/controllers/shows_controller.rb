# frozen_string_literal: true

class ShowsController < ApplicationController
  def index
    @shows = Show.includes(:channel).order(created_at: :desc)
    @shows = @shows.joins(:channel).where('shows.name LIKE ? OR channels.name LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
  end

  def favorites
    @favorite_shows = current_user.shows.includes(:channel)
  end

  def mark_favorite
    show = Show.find(params[:show_id])
    if current_user.favorites.where(show_id: show.id).first_or_create!
      flash.notice = 'Yeay! Show set as favorite!'
    else
      flash.alert = 'Could not mark show as favorite!'
    end
    if params[:back_page] == 'favorites'
      redirect_to favorites_shows_path
    else
      redirect_to shows_path(search: params[:search])
    end
  end

  def remove_favorite
    show = Show.find(params[:show_id])
    if current_user.favorites.where(show_id: show.id).first&.destroy
      flash.notice = 'Show removed from favorites!'
    else
      flash.alert = 'Could not remove show from favorite!'
    end
    if params[:back_page] == 'favorites'
      redirect_to favorites_shows_path
    else
      redirect_to shows_path(search: params[:search])
    end
  end
end

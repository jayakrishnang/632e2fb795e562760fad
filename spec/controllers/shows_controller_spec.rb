# frozen_string_literal: true

require 'rails_helper'
RSpec.describe ShowsController, type: :controller do
  let!(:user) { create(:user) }
  scenario "User clicks on home button" do
  	sign_in user
    visit "/shows"

    # fill_in "Name", :with => "My Widget"
    click_button "commit"

    expect(page).to have_text("Search Results")
  end
end
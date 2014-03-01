require 'spec_helper'

describe "user can delete account" do
  let(:user) { FactoryGirl.create(:user) }

  it "deletes user account" do
    
    # Setup
    login(user)
    
    # Workflow
    click_link "my account"
    click_button "Delete My Account"

    # Expectations
    expect(page).to have_content "Welcome to REsearchr"

  end

  def login(user)
    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
  end


end
require 'spec_helper'

describe "user login process" do
  let(:user) { FactoryGirl.create(:user) }

  it "will login an existing user" do
    
    # Setup
    login(user)
    # Workflow

    # Expectations
    expect(page).to have_content "View Saved Searches"
  end

  def login(user)
    visit root_path
    click_link "login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
  end

end
require 'spec_helper'

describe "user can update account info" do
  let(:user) { FactoryGirl.create(:user) }

  it "can update email address" do
    
    # Setup
    login(user)
    # Workflow
    click_link "Edit My Info"
    fill_in :user_first_name, with: "Capybara"
    click_button "Save Changes"

    # Expectations
    expect(page).to have_content "Welcome Capybara!"
  end

  

  def login(user)
    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
  end


end
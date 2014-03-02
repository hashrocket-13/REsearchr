require 'spec_helper'

describe "user enters invalid data" do
  let(:user) { FactoryGirl.create(:user) }

  it "redirects you to an error page" do
    
    # Setup
    login(user)

    # Worlflow
    visit new_user_query_path(user)
    select('Sales', :from => 'title')
    fill_in "zip", with: "10024"
    fill_in "beds", with: "1"
    fill_in "baths", with: "1"
    click_button "Submit Search"

    # Expectations


  end

  def login(user)
    visit root_path
    click_link "login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
  end

end
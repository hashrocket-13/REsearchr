require 'spec_helper'

describe "user can delete a query on index page" do
  let(:user) { FactoryGirl.create(:user) }
  let(:test_query) { FactoryGirl.create(:query) }

  before do
    user.queries(test_query)
  end

  it "will delete a query" do
    # Setup
    login(user)

    # Workflow for feature
    visit new_user_query_path(user)
    fill_in "title", with: "sales"
    fill_in "zip", with: "10024"
    fill_in "beds", with: "1"
    fill_in "baths", with: "1"
    click_button "Submit Search"
    save_and_open_page

    # Expectations
    
  end




  def login(user)
    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
  end 

end
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
    visit user_queries_path(user)
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
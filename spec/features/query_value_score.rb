require 'spec_helper'

describe "algo for quality and color method" do
  let(:user) { FactoryGirl.create(:user) }

  it "will assign a value score" do
    
    # Setup
    login(user)
    # Workflow
    click_link "Enter a new query"
    fill_in "title", with: "sales"
    fill_in "zip", with: "10024"
    fill_in "beds", with: "1"
    fill_in "baths", with: "1"
    click_button "Submit Search"
    # save_and_open_page
    # Expectations
    expect(page).should have_css('#scoregreen')


  end

  def login(user)
    visit root_path
    click_link "login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
  end


end
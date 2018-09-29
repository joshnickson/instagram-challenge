require 'rails_helper'

RSpec.feature "Create posts", type: :feature do
  scenario "user creates a post" do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "test.jpg")
    fill_in 'Caption', with: 'test #test' 
    click_button 'Create Post'
    expect(page).to have_content('#test')
    expect(page).to have_css("img[src*='test.jpg']")
  end
end